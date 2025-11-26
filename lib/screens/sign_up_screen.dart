import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../backend/user_profile_service.dart'; // Added
import '../widgets/custom_text_field.dart';
import '../widgets/gradient_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final UserProfileService _userProfileService = UserProfileService(); // Added

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  // -------------------------------------------------------
  // FIREBASE SIGN UP + SAVE USER TO FIRESTORE + USER PROFILE SERVICE
  // -------------------------------------------------------
  Future<void> _handleSignUp() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _showMessage("All fields are required.");
      return;
    }

    setState(() => _isLoading = true);

    try {
      // Create user in Firebase Authentication
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      final uid = credential.user!.uid;

      // Save user data to Firestore
      await FirebaseFirestore.instance.collection("users").doc(uid).set({
        "uid": uid,
        "name": name,
        "email": email,
        "photoUrl": "",
        "level": 1,
        "totalXP": 0,
        "createdAt": DateTime.now(),
      });

      // Add user profile to UserProfileService local backend simulation
      _userProfileService.createProfile(uid, name, email);

      _showMessage("Account created successfully!");

      if (!mounted) return;
      Navigator.pop(context); // go back to Login Screen
    } on FirebaseAuthException catch (e) {
      _showMessage(e.message ?? "Signup failed.");
    } catch (e) {
      _showMessage("Unexpected error: $e");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // -------------------------------------------------------
  void _showMessage(String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1A3A52), Color(0xFF0D1F2D)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: screenWidth * 0.9 < 450
                      ? screenWidth * 0.9
                      : 450,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: screenWidth * 0.07 > 30
                            ? 30
                            : screenWidth * 0.07,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Join CodeQuest and start learning today!',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04 > 16
                            ? 16
                            : screenWidth * 0.04,
                        color: Colors.white.withAlpha(220),
                      ),
                    ),
                    const SizedBox(height: 28),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(40),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(screenWidth * 0.08),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Name',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1A1A1A)),
                          ),
                          const SizedBox(height: 6),
                          CustomTextField(
                            controller: _nameController,
                            hintText: 'Jane Doe',
                            prefixIcon: Icons.person_outline,
                          ),

                          const SizedBox(height: 14),
                          const Text(
                            'Email',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1A1A1A)),
                          ),
                          const SizedBox(height: 6),
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'you@example.com',
                            prefixIcon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                          ),

                          const SizedBox(height: 14),
                          const Text(
                            'Password',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1A1A1A)),
                          ),
                          const SizedBox(height: 6),
                          CustomTextField(
                            controller: _passwordController,
                            hintText: '••••••••',
                            prefixIcon: Icons.lock_outline,
                            isPassword: true,
                          ),

                          const SizedBox(height: 28),

                          // FIXED BUTTON HERE
                          GradientButton(
                            text: _isLoading ? "Creating..." : "Sign Up",
                            onPressed: () {
                              if (!_isLoading) {
                                _handleSignUp();
                              }
                            },
                          ),

                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account? ",
                                style: TextStyle(
                                    color: Color(0xFF666666),
                                    fontSize: 14),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    color:
                                        Color.fromRGBO(52, 141, 188, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
