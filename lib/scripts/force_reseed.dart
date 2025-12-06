import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import '../backend/course_module_management.dart';

Future<void> main() async {
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final firestore = FirebaseFirestore.instance;
  
  log('=== FORCE RE-SEED SCRIPT ===\n');
  
  // Step 1: Delete all courses
  log('Step 1: Deleting all courses from Firestore...');
  final coursesSnapshot = await firestore.collection('courses').get();
  log('Found ${coursesSnapshot.docs.length} courses to delete');
  
  for (var doc in coursesSnapshot.docs) {
    log('  Deleting course: ${doc.id}');
    await doc.reference.delete();
  }
  log('✓ All courses deleted\n');
  
  // Step 2: Verify deletion
  log('Step 2: Verifying deletion...');
  final verifySnapshot = await firestore.collection('courses').get();
  log('Courses remaining: ${verifySnapshot.docs.length}');
  if (verifySnapshot.docs.isNotEmpty) {
    log('ERROR: Courses still exist in Firestore!');
    return;
  }
  log('✓ Deletion verified\n');
  
  // Step 3: Seed with fresh data
  log('Step 3: Seeding with fresh data...');
  final service = CourseModuleService();
  final courses = service.getAllCourses();
  
  for (var course in courses) {
    log('Seeding course: ${course.courseId}');
    
    // Check modules
    for (var module in course.modules) {
      log('  Module: ${module.moduleId}');
      log('    Title: ${module.title}');
      log('    pdfUrl: ${module.pdfUrl ?? "NULL"}');
    }
    
    // Save to Firestore
    final docRef = firestore.collection('courses').doc(course.courseId);
    final courseData = course.toMap();
    await docRef.set(courseData);
    log('  ✓ Saved to Firestore');
  }
  
  log('\n=== RE-SEEDING COMPLETE ===');
  log('Please restart your Flutter app to see the changes.');
  
  // Step 4: Verify the data
  log('\nStep 4: Verifying seeded data...');
  final finalSnapshot = await firestore.collection('courses').get();
  log('Total courses in Firestore: ${finalSnapshot.docs.length}');
  
  for (var doc in finalSnapshot.docs) {
    final data = doc.data();
    log('\nCourse: ${doc.id}');
    final modules = data['modules'] as List<dynamic>?;
    if (modules != null) {
      for (var moduleData in modules) {
        final moduleMap = moduleData as Map<String, dynamic>;
        log('  Module: ${moduleMap['moduleId']}');
        log('    pdfUrl: ${moduleMap['pdfUrl'] ?? "NULL"}');
      }
    }
  }
}
