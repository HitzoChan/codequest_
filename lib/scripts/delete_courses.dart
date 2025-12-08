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
  
  log('Deleting courses collection...');
  
  // Get all course documents
  final coursesSnapshot = await firestore.collection('courses').get();
  
  log('Found ${coursesSnapshot.docs.length} courses to delete');
  
  // Delete each course document and its subcollections
  for (var doc in coursesSnapshot.docs) {
    log('Deleting course: ${doc.id}');
    
    // Delete modules subcollection
    final modulesSnapshot = await doc.reference.collection('modules').get();
    for (var moduleDoc in modulesSnapshot.docs) {
      log('  Deleting module: ${moduleDoc.id}');
      await moduleDoc.reference.delete();
    }
    
    // Delete the course document
    await doc.reference.delete();
  }
  
  log('Successfully deleted all courses!');
  log('\nRe-seeding courses with updated data...');
  
  // Re-seed with updated data
  final service = CourseModuleService();
  final courses = service.getAllCourses();
  
  final batch = firestore.batch();
  for (var course in courses) {
    log('Seeding course: ${course.courseId}');
    final docRef = firestore.collection('courses').doc(course.courseId);
    final courseData = course.toMap();
    log('  Course data: $courseData');
    
    // Check beginner module specifically
    for (var module in course.modules) {
      if (module.moduleId == 'programming_fundamentals_beginner_01') {
        log('  Beginner Module pdfUrl: ${module.pdfUrl}');
      }
    }
    
    batch.set(docRef, courseData);
  }
  await batch.commit();
  
  log('\nCourses re-seeded successfully!');
  log('You can now restart your app.');
}
