import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'course_models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Course>> fetchCourses() async {
    final snapshot = await _db.collection('courses').get();
    return snapshot.docs.map((d) => Course.fromMap(d.data())).toList();
  }

  Future<void> seedCoursesIfEmpty(List<Course> seedCourses) async {
    final snapshot = await _db.collection('courses').limit(1).get();
    debugPrint('DEBUG seedCoursesIfEmpty: Found ${snapshot.docs.length} courses in Firestore');
    
    if (snapshot.docs.isEmpty) {
      debugPrint('DEBUG: Firestore is empty, seeding courses...');
      // Seed initial course documents
      final batch = _db.batch();
      for (var c in seedCourses) {
        final docRef = _db.collection('courses').doc(c.courseId);
        final courseData = c.toMap();
        debugPrint('DEBUG: Seeding course ${c.courseId} with data: $courseData');
        batch.set(docRef, courseData);
      }
      await batch.commit();
      debugPrint('DEBUG: Seeding completed');
    } else {
      debugPrint('DEBUG: Firestore already has courses, skipping seed');
    }
  }

  Future<void> forceUpdateCourses(List<Course> seedCourses) async {
    debugPrint('DEBUG: Force updating courses in Firestore...');
    final batch = _db.batch();
    for (var c in seedCourses) {
      final docRef = _db.collection('courses').doc(c.courseId);
      final courseData = c.toMap();
      debugPrint('DEBUG: Force updating course ${c.courseId}');
      // Check pdfUrl in modules
      for (var module in c.modules) {
        if (module.moduleId == 'sql_intro_01') {
          debugPrint('DEBUG: SQL module pdfUrl in update: ${module.pdfUrl}');
        }
      }
      batch.set(docRef, courseData, SetOptions(merge: false)); // Overwrite completely
    }
    await batch.commit();
    debugPrint('DEBUG: Force update completed');
  }

  Future<void> enrollUser(String userId, String moduleId) async {
    final doc = _db.collection('user_progress').doc('$userId::$moduleId');
    await doc.set({
      'userId': userId,
      'moduleId': moduleId,
      'status': 'enrolled',
      'startedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Future<void> completeModule(String userId, String moduleId) async {
    final doc = _db.collection('user_progress').doc('$userId::$moduleId');
    await doc.set({
      'userId': userId,
      'moduleId': moduleId,
      'status': 'completed',
      'completedAt': FieldValue.serverTimestamp(),
      'completionPercentage': 100,
    }, SetOptions(merge: true));
  }

  /// Increment user's total XP and record history. Returns the updated total XP.
  Future<int> incrementUserXp(String userId, int xp, String source) async {
    // XP removed: do not write or update any global XP fields in Firestore.
    // For compatibility, return the current stored total if present, otherwise 0.
    final userRef = _db.collection('users').doc(userId);
    try {
      final snapshot = await userRef.get();
      int current = 0;
      if (snapshot.exists && snapshot.data() != null) {
        final data = snapshot.data()!;
        if (data.containsKey('total_xp')) {
          final val = data['total_xp'];
          if (val is int) {
            current = val;
          } else if (val is num) {
            current = val.toInt();
          }
        } else if (data.containsKey('totalXP')) {
          final val = data['totalXP'];
          if (val is int) {
            current = val;
          } else if (val is num) {
            current = val.toInt();
          }
        }
      }
      return current;
    } catch (e) {
      // ignore: avoid_print
      print('incrementUserXp skipped (XP disabled): $e');
      return 0;
    }
  }

  Future<bool> isModuleCompleted(String userId, String moduleId) async {
    final doc = await _db.collection('user_progress').doc('$userId::$moduleId').get();
    if (!doc.exists) {
      return false;
    }
    final data = doc.data();
    if (data == null) {
      return false;
    }
    return (data['status'] ?? '') == 'completed';
  }

  Future<void> updateUserProfile(String userId, Map<String, dynamic> updates) async {
    await _db.collection('users').doc(userId).set(updates, SetOptions(merge: true));
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserProfile(String userId) async {
    return await _db.collection('users').doc(userId).get();
  }

  Future<void> createOrUpdateUserProfile(String userId, Map<String, dynamic> profile) async {
    await _db.collection('users').doc(userId).set(profile, SetOptions(merge: true));
  }

  // Avatar uploading is handled by a server-side Google Drive endpoint instead of Firebase Storage.
  // This method was intentionally removed. Use `createOrUpdateUserProfile` to update an avatar URL on the user document.

  Future<void> updateUserPreferences(String userId, Map<String, dynamic> prefs) async {
    await _db.collection('users').doc(userId).set({'preferences': prefs}, SetOptions(merge: true));
  }

  Future<void> recordQuizAttempt(String userId, String quizId, int score, bool passed, int timeTakenMillis) async {
    final attemptRef = _db.collection('quiz_attempts').doc();
    await attemptRef.set({
      'userId': userId,
      'quizId': quizId,
      'score': score,
      'passed': passed,
      'timeTaken': timeTakenMillis,
      'attemptedAt': FieldValue.serverTimestamp(),
    });
  }

  /// Add XP to a specific module entry under `user_progress`.
  /// Creates the progress doc if missing and increments the `xp` field.
  Future<void> addXpToModule(String userId, String moduleId, int xp) async {
    // XP removed: module-level XP is no longer tracked. This function is intentionally
    // a no-op to avoid writing XP fields to Firestore.
    return;
  }

  /// Wrapper to add XP for a user. Validates positive amounts, updates global XP
  /// and optionally credits the module-level XP when `moduleId` is provided.
  /// Returns the updated total XP or null when no-op.
  Future<int?> addXp(String userId, int amount, {String source = 'manual', String? moduleId}) async {
    // XP removed: awarding global or module XP is disabled. Keep as no-op.
    return null;
  }

  /// Atomically decrement the user's hearts by `amount`. Returns the updated hearts count, or null on failure.
  Future<int?> decrementUserHearts(String userId, int amount) async {
    final userRef = _db.collection('users').doc(userId);
    try {
      final newVal = await _db.runTransaction<int?>((tx) async {
        final snap = await tx.get(userRef);
        int current = 0;
        if (snap.exists && snap.data() != null) {
          final data = snap.data()!;
          final val = data['hearts'];
          if (val is int) { current = val; }
          else if (val is num) { current = val.toInt(); }
        }
        var updated = current - amount;
        if (updated < 0) updated = 0;
        if (updated > 5) updated = 5;
        // update hearts and reset the regen timer
        tx.set(userRef, {'hearts': updated, 'hearts_last_updated': FieldValue.serverTimestamp()}, SetOptions(merge: true));
        return updated;
      });
      return newVal;
    } catch (e) {
      // ignore: avoid_print
      print('Failed to decrement hearts: $e');
      return null;
    }
  }

  /// Ensure hearts are regenerated based on elapsed time since `hearts_last_updated`.
  /// This method reads the user doc, computes how many 20-minute intervals have passed,
  /// increments hearts accordingly up to 5, and updates the user doc if needed.
  Future<int?> ensureHeartsUpdated(String userId, {int maxHearts = 5, int regenMinutes = 20}) async {
    final userRef = _db.collection('users').doc(userId);
    try {
      final snap = await userRef.get();
      if (!snap.exists || snap.data() == null) {
        // Initialize a new user document with full hearts when missing.
        await userRef.set({'hearts': maxHearts, 'hearts_last_updated': FieldValue.serverTimestamp()}, SetOptions(merge: true));
        return maxHearts;
      }
      final data = snap.data()!;
      // If the document exists but has no explicit `hearts` field, initialize it.
      final hasHeartsField = data.containsKey('hearts');
      int hearts = 0;
      final val = data['hearts'];
      if (!hasHeartsField || val == null) {
        // Initialize missing hearts to the maximum allowed
        await userRef.set({'hearts': maxHearts, 'hearts_last_updated': FieldValue.serverTimestamp()}, SetOptions(merge: true));
        return maxHearts;
      }
      if (val is int) {
        hearts = val;
      } else if (val is num) {
        hearts = val.toInt();
      }

      if (hearts >= maxHearts) {
        return hearts;
      }

      final ts = data['hearts_last_updated'];
      DateTime lastUpdated;
      if (ts is Timestamp) {
        lastUpdated = ts.toDate().toUtc();
      } else if (ts is Map && ts['_seconds'] != null) {
        // Firestore may return a map in some contexts
        final seconds = ts['_seconds'] as int;
        lastUpdated = DateTime.fromMillisecondsSinceEpoch(seconds * 1000).toUtc();
      } else {
        // No timestamp recorded, set now and return current hearts
        await userRef.set({'hearts_last_updated': FieldValue.serverTimestamp()}, SetOptions(merge: true));
        return hearts;
      }

      final now = DateTime.now().toUtc();
      final elapsed = now.difference(lastUpdated);
      final regenInterval = Duration(minutes: regenMinutes);
      final regenCount = elapsed.inSeconds ~/ regenInterval.inSeconds;
      if (regenCount <= 0) {
        return hearts;
      }

      var newHearts = hearts + regenCount;
      if (newHearts > maxHearts) {
        newHearts = maxHearts;
      }

      // Update hearts and reset last_updated to now (server time)
      await userRef.set({'hearts': newHearts, 'hearts_last_updated': FieldValue.serverTimestamp()}, SetOptions(merge: true));
      return newHearts;
    } catch (e) {
      // ignore: avoid_print
      print('Failed to ensure hearts updated: $e');
      return null;
    }
  }

  /// Record a quiz attempt with per-question answers.
  /// `answers` should be a list where each entry is the selected index (int) or null.
  Future<void> recordQuizAttemptDetailed(String userId, String quizId, int score, bool passed, int timeTakenMillis, List<int?> answers) async {
    final attemptRef = _db.collection('quiz_attempts').doc();
    await attemptRef.set({
      'userId': userId,
      'quizId': quizId,
      'score': score,
      'passed': passed,
      'timeTaken': timeTakenMillis,
      'answers': answers,
      'attemptedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<List<Map<String, dynamic>>> fetchQuizAttemptsForUser(String userId) async {
    final snapshot = await _db
        .collection('quiz_attempts')
        .where('userId', isEqualTo: userId)
        .orderBy('attemptedAt', descending: true)
        .get();
    return snapshot.docs.map((d) {
      final m = d.data();
      m['id'] = d.id;
      return m;
    }).toList();
  }

  Future<List<Map<String, dynamic>>> getUserProgress(String userId) async {
    final snapshot = await _db.collection('user_progress').where('userId', isEqualTo: userId).get();
    return snapshot.docs.map((d) => d.data()).toList();
  }

  /// Recalculate aggregated learning stats for a user and store them on the users/{userId} doc.
  /// Returns the computed map of fields written.
  Future<Map<String, dynamic>> recalculateLearningStatsForUser(String userId) async {
    final Map<String, dynamic> updates = {};

    // modules completed & study time
    final upQuery = await _db.collection('user_progress').where('userId', isEqualTo: userId).get();
    int modulesCompleted = 0;
    int totalStudyMinutes = 0;
    for (final doc in upQuery.docs) {
      final data = doc.data();
      final bool isCompleted = (data['completed'] == true) || ((data['status'] as String?) == 'completed');
      if (isCompleted) {
        modulesCompleted++;
      }
      if (data['timeSpentMinutes'] is int) {
        totalStudyMinutes += data['timeSpentMinutes'] as int;
      }
    }

    // total modules
    final courses = await _db.collection('courses').get();
    int totalModules = 0;
    for (final c in courses.docs) {
      final m = c.data()['modules'];
      if (m is List) {
        totalModules += m.length;
      }
    }
    if (totalModules == 0) {
      totalModules = 8; // fallback
    }

    // quizzes passed & average score
    final qa = await _db.collection('quiz_attempts').where('userId', isEqualTo: userId).get();
    final passedQuizIds = <String>{};
    int scoreSum = 0;
    int scoreCount = 0;
    for (final q in qa.docs) {
      final data = q.data();
      if (data['passed'] == true && data['quizId'] is String) {
        passedQuizIds.add(data['quizId'] as String);
      }
      if (data['score'] is int) {
        scoreSum += data['score'] as int;
        scoreCount++;
      }
    }
    final quizzesPassed = passedQuizIds.length;
    final avgScore = scoreCount > 0 ? '${(scoreSum / scoreCount).round()}%' : '—';

    final studyTime = '${(totalStudyMinutes / 60).floor()}h ${(totalStudyMinutes % 60)}m';

    updates['modulesCompleted'] = modulesCompleted;
    updates['totalModules'] = totalModules;
    updates['quizzesPassed'] = quizzesPassed;
    updates['averageScore'] = avgScore;
    updates['studyTime'] = studyTime;

    await _db.collection('users').doc(userId).set(updates, SetOptions(merge: true));
    return updates;
  }

  /// Set pdfUrl for a module inside the courses/course.modules array.
  /// Looks for moduleId in courses and updates the module pdfUrl field.
  Future<void> setModulePdfUrl(String moduleId, String pdfUrl) async {
    final snapshot = await _db.collection('courses').get();
    for (final doc in snapshot.docs) {
      final data = doc.data();
      final modules = (data['modules'] as List<dynamic>?) ?? [];
      bool updated = false;
      final newModules = modules.map((m) {
        final map = Map<String, dynamic>.from(m);
        if ((map['moduleId'] ?? '') == moduleId) {
          map['pdfUrl'] = pdfUrl;
          updated = true;
        }
        return map;
      }).toList();
      if (updated) {
        await _db.collection('courses').doc(doc.id).set({'modules': newModules}, SetOptions(merge: true));
        return;
      }
    }
  }
}
