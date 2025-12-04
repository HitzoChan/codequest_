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
  
  print('=== FORCE RE-SEED SCRIPT ===\n');
  
  // Step 1: Delete all courses
  print('Step 1: Deleting all courses from Firestore...');
  final coursesSnapshot = await firestore.collection('courses').get();
  print('Found ${coursesSnapshot.docs.length} courses to delete');
  
  for (var doc in coursesSnapshot.docs) {
    print('  Deleting course: ${doc.id}');
    await doc.reference.delete();
  }
  print('✓ All courses deleted\n');
  
  // Step 2: Verify deletion
  print('Step 2: Verifying deletion...');
  final verifySnapshot = await firestore.collection('courses').get();
  print('Courses remaining: ${verifySnapshot.docs.length}');
  if (verifySnapshot.docs.isNotEmpty) {
    print('ERROR: Courses still exist in Firestore!');
    return;
  }
  print('✓ Deletion verified\n');
  
  // Step 3: Seed with fresh data
  print('Step 3: Seeding with fresh data...');
  final service = CourseModuleService();
  final courses = service.getAllCourses();
  
  for (var course in courses) {
    print('Seeding course: ${course.courseId}');
    
    // Check modules
    for (var module in course.modules) {
      print('  Module: ${module.moduleId}');
      print('    Title: ${module.title}');
      print('    pdfUrl: ${module.pdfUrl ?? "NULL"}');
    }
    
    // Save to Firestore
    final docRef = firestore.collection('courses').doc(course.courseId);
    final courseData = course.toMap();
    await docRef.set(courseData);
    print('  ✓ Saved to Firestore');
  }
  
  print('\n=== RE-SEEDING COMPLETE ===');
  print('Please restart your Flutter app to see the changes.');
  
  // Step 4: Verify the data
  print('\nStep 4: Verifying seeded data...');
  final finalSnapshot = await firestore.collection('courses').get();
  print('Total courses in Firestore: ${finalSnapshot.docs.length}');
  
  for (var doc in finalSnapshot.docs) {
    final data = doc.data();
    print('\nCourse: ${doc.id}');
    final modules = data['modules'] as List<dynamic>?;
    if (modules != null) {
      for (var moduleData in modules) {
        final moduleMap = moduleData as Map<String, dynamic>;
        print('  Module: ${moduleMap['moduleId']}');
        print('    pdfUrl: ${moduleMap['pdfUrl'] ?? "NULL"}');
      }
    }
  }
}
