import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../backend/user_profile_service.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/gradient_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  final UserProfileService _userProfileService = UserProfileService();

  // ================================================================
  // EMAIL LOGIN
  // ================================================================
  Future<void> _handleEmailLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showMessage("Email and password are required");
      return;
    }

    setState(() => _isLoading = true);

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool("loggedIn", true);

      final uid = userCredential.user?.uid;
      final displayName =
          userCredential.user?.displayName ??
              userCredential.user?.email ??
              'User';
      final emailValue = userCredential.user?.email ?? email;

      if (uid != null) {
        final profile = _userProfileService.getProfile(uid);
        if (profile == null) {
          _userProfileService.createProfile(uid, displayName, emailValue);
        } else {
          _userProfileService.updateProfile(
              uid, name: displayName, email: emailValue);
        }
      }

      if (!mounted) return;
      Navigator.pushReplacementNamed(context, "/home");
    } catch (e) {
      _showMessage("Login failed");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // ================================================================
  // GOOGLE LOGIN
  // ================================================================
  Future<void> _handleGoogleSignIn() async {
    setState(() => _isLoading = true);

    try {
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn().signIn();
      if (googleUser == null) {
        setState(() => _isLoading = false);
        return;
      }

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool("loggedIn", true);

      final uid = userCredential.user?.uid;
      final displayName = userCredential.user?.displayName ?? 'User';
      final emailValue = userCredential.user?.email ?? '';
      final photoUrl = userCredential.user?.photoURL ?? '';

      if (uid != null) {
        final userDoc =
            FirebaseFirestore.instance.collection('users').doc(uid);

        final snapshot = await userDoc.get();
        if (!snapshot.exists) {
          await userDoc.set({
            'name': displayName,
            'email': emailValue,
            'avatarUrl': photoUrl,
            'xp': 0,
            'level': 1,
          });
        }

        final profile = _userProfileService.getProfile(uid);
        if (profile == null) {
          _userProfileService.createProfile(uid, displayName, emailValue);
        } else {
          _userProfileService.updateProfile(
              uid, name: displayName, email: emailValue);
        }
      }

      if (!mounted) return;
      Navigator.pushReplacementNamed(context, "/home");
    } catch (e) {
      _showMessage("Google Sign-In failed");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // ================================================================
  // RESET PASSWORD
  // ================================================================
  Future<void> _handleForgotPassword() async {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      _showMessage("Enter your email first.");
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      _showMessage("Password reset email sent.");
    } catch (_) {
      _showMessage("Unable to send reset email.");
    }
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // ====================================================================
  // UI STARTS HERE
  // ====================================================================
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final logoSize = screenWidth * 0.20;
    final cardMaxWidth = screenWidth < 500 ? screenWidth * 0.9 : 480.0;

    return Scaffold(
      body: Stack(
        children: [
          // -------------------------------------------------------------
          // BACKGROUND GRADIENT
          // -------------------------------------------------------------
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFB3E5FC),
                  Color(0xFF81D4FA),
                  Color(0xFF4FC3F7),
                  Color(0xFF29B6F6),
                ],
              ),
            ),
          ),

          // -------------------------------------------------------------
          // AESTHETIC TRANSLUCENT BUBBLES
          // -------------------------------------------------------------
          Positioned(
            top: -60,
            right: -40,
            child: _bubble(160.0),
          ),
          Positioned(
            bottom: -80,
            left: -50,
            child: _bubble(220.0),
          ),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
                  children: [
                    const SizedBox(height: 25.0),

                    // ---------------------------------------------------------
                    // LOGOS WITH GLOW EFFECT
                    // ---------------------------------------------------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _glowLogo("assets/images/university_logo.png", logoSize),
                        _glowLogo("assets/images/cas_logo.png", logoSize),
                      ],
                    ),

                    const SizedBox(height: 40.0),

                    const Text(
                      "Welcome Back to CodeQuest",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF0D1B2A),
                        fontSize: 32.0,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.5,
                      ),
                    ),

                    const SizedBox(height: 45.0),

                    // ---------------------------------------------------------
                    // GLASSMORPHISM LOGIN CARD
                    // ---------------------------------------------------------
                    ClipRRect(
                      borderRadius: BorderRadius.circular(28.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 14.0, sigmaY: 14.0),
                        child: Container(
                          width: cardMaxWidth,
                          padding: EdgeInsets.all(screenWidth * 0.07),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.20),
                            borderRadius: BorderRadius.circular(28.0),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.40),
                              width: 1.4,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),

                              const SizedBox(height: 8.0),

                              Text(
                                'Enter your login details',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white.withValues(alpha: 0.85),
                                ),
                              ),

                              const SizedBox(height: 26.0),

                              const Text(
                                'Email',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),

                              const SizedBox(height: 6.0),

                              CustomTextField(
                                controller: _emailController,
                                hintText: "you@example.com",
                                prefixIcon: Icons.email_outlined,
                              ),

                              const SizedBox(height: 20.0),

                              const Text(
                                'Password',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),

                              const SizedBox(height: 6.0),

                              CustomTextField(
                                controller: _passwordController,
                                hintText: "••••••••",
                                prefixIcon: Icons.lock_outline,
                                isPassword: true,
                              ),

                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: _handleForgotPassword,
                                  child: const Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),

                              GradientButton(
                                text: _isLoading ? "Loading..." : "Login",
                                onPressed: () {
                                  if (_isLoading) return;
                                  _handleEmailLogin();
                                },
                              ),

                              const SizedBox(height: 18.0),

                              Row(
                                children: [
                                  Expanded(
                                      child: Divider(
                                          color: Colors.white54)),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Text(
                                      "or",
                                      style: TextStyle(
                                          color: Colors.white70),
                                    ),
                                  ),
                                  Expanded(
                                      child: Divider(
                                          color: Colors.white54)),
                                ],
                              ),

                              const SizedBox(height: 16.0),

                              OutlinedButton(
                                onPressed: _handleGoogleSignIn,
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                      color: Colors.white.withValues(alpha: 0.60),
                                      width: 1.4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      "https://www.google.com/favicon.ico",
                                      width: 20.0,
                                      height: 20.0,
                                    ),
                                    const SizedBox(width: 10.0),
                                    const Text(
                                      "Continue with Google",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 20.0),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Don't have an account?",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pushNamed(context, "/signup"),
                                    child: const Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 60.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ====================================================================
  // LOGO WITH GLOW
  // ====================================================================
  Widget _glowLogo(String path, double size) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.6),
            blurRadius: 18.0,
            spreadRadius: 2.0,
          )
        ],
      ),
      child: Image.asset(
        path,
        width: size,
        height: size,
        fit: BoxFit.contain,
      ),
    );
  }

  // ====================================================================
  // TRANSLUCENT BUBBLES
  // ====================================================================
  Widget _bubble(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: 0.15),
      ),
    );
  }
}
