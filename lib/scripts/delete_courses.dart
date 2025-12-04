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
  
  print('Deleting courses collection...');
  
  // Get all course documents
  final coursesSnapshot = await firestore.collection('courses').get();
  
  print('Found ${coursesSnapshot.docs.length} courses to delete');
  
  // Delete each course document and its subcollections
  for (var doc in coursesSnapshot.docs) {
    print('Deleting course: ${doc.id}');
    
    // Delete modules subcollection
    final modulesSnapshot = await doc.reference.collection('modules').get();
    for (var moduleDoc in modulesSnapshot.docs) {
      print('  Deleting module: ${moduleDoc.id}');
      await moduleDoc.reference.delete();
    }
    
    // Delete the course document
    await doc.reference.delete();
  }
  
  print('Successfully deleted all courses!');
  print('\nRe-seeding courses with updated data...');
  
  // Re-seed with updated data
  final service = CourseModuleService();
  final courses = service.getAllCourses();
  
  final batch = firestore.batch();
  for (var course in courses) {
    print('Seeding course: ${course.courseId}');
    final docRef = firestore.collection('courses').doc(course.courseId);
    final courseData = course.toMap();
    print('  Course data: $courseData');
    
    // Check SQL module specifically
    for (var module in course.modules) {
      if (module.moduleId == 'sql_intro_01') {
        print('  SQL Module pdfUrl: ${module.pdfUrl}');
      }
    }
    
    batch.set(docRef, courseData);
  }
  await batch.commit();
  
  print('\nCourses re-seeded successfully!');
  print('You can now restart your app.');
}
