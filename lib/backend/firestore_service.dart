import 'package:cloud_firestore/cloud_firestore.dart';
import 'course_module_management.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Course>> fetchCourses() async {
    final snapshot = await _db.collection('courses').get();
    return snapshot.docs.map((d) => Course.fromMap(d.data())).toList();
  }

  Future<void> seedCoursesIfEmpty(List<Course> seedCourses) async {
    final snapshot = await _db.collection('courses').limit(1).get();
    print('DEBUG seedCoursesIfEmpty: Found ${snapshot.docs.length} courses in Firestore');
    
    if (snapshot.docs.isEmpty) {
      print('DEBUG: Firestore is empty, seeding courses...');
      // Seed initial course documents
      final batch = _db.batch();
      for (var c in seedCourses) {
        final docRef = _db.collection('courses').doc(c.courseId);
        final courseData = c.toMap();
        print('DEBUG: Seeding course ${c.courseId} with data: $courseData');
        batch.set(docRef, courseData);
      }
      await batch.commit();
      print('DEBUG: Seeding completed');
    } else {
      print('DEBUG: Firestore already has courses, skipping seed');
    }
  }

  Future<void> forceUpdateCourses(List<Course> seedCourses) async {
    print('DEBUG: Force updating courses in Firestore...');
    final batch = _db.batch();
    for (var c in seedCourses) {
      final docRef = _db.collection('courses').doc(c.courseId);
      final courseData = c.toMap();
      print('DEBUG: Force updating course ${c.courseId}');
      // Check pdfUrl in modules
      for (var module in c.modules) {
        if (module.moduleId == 'sql_intro_01') {
          print('DEBUG: SQL module pdfUrl in update: ${module.pdfUrl}');
        }
      }
      batch.set(docRef, courseData, SetOptions(merge: false)); // Overwrite completely
    }
    await batch.commit();
    print('DEBUG: Force update completed');
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
    // add XP for completion
    await incrementUserXp(userId, 200, 'module_completion');
  }

  /// Increment user's total XP and record history. Returns the updated total XP.
  Future<int> incrementUserXp(String userId, int xp, String source) async {
    final userRef = _db.collection('users').doc(userId);
    final xpHistoryRef = _db.collection('xp_history').doc();

    final newTotal = await _db.runTransaction<int>((tx) async {
      final snapshot = await tx.get(userRef);
      int current = 0;
      if (snapshot.exists && snapshot.data() != null) {
        final data = snapshot.data()!;
        if (data.containsKey('total_xp')) {
          final val = data['total_xp'];
          if (val is int) current = val;
          else if (val is num) current = val.toInt();
        }
        if (data.containsKey('totalXP')) {
          final val = data['totalXP'];
          if (val is int) current = val;
          else if (val is num) current = val.toInt();
        }
      }

      final updated = current + xp;
      tx.set(userRef, {'total_xp': updated, 'totalXP': updated}, SetOptions(merge: true));
      tx.set(xpHistoryRef, {
        'userId': userId,
        'xp_amount': xp,
        'source': source,
        'earned_at': FieldValue.serverTimestamp(),
      });
      return updated;
    });

    return newTotal;
  }

  Future<bool> isModuleCompleted(String userId, String moduleId) async {
    final doc = await _db.collection('user_progress').doc('$userId::$moduleId').get();
    if (!doc.exists) return false;
    final data = doc.data();
    if (data == null) return false;
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
