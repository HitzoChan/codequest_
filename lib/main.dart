import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';       // ← Added
import 'firebase_options.dart';                          // ← Added

import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/progress_screen.dart';
import 'screens/modules_screen.dart';
import 'screens/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();             // ← Important for Firebase

  await Firebase.initializeApp(                         // ← Initialize Firebase
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const CodeQuestApp());
}

class CodeQuestApp extends StatelessWidget {
  const CodeQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CodeQuest',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(52, 141, 188, 1),
        scaffoldBackgroundColor: const Color(0xFF1A3A52),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(52, 141, 188, 1),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Inter',
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/modules': (context) => const ModulesScreen(),
        '/progress': (context) => const ProgressScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/signup': (context) => const SignUpScreen(),
      },
      home: const LoginScreen(),
    );
  }
}
