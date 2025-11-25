import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  // -------------------------------------------------------
  // EMAIL + PASSWORD SIGN IN
  // -------------------------------------------------------
  Future<void> _handleEmailLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showMessage("Email and password are required");
      return;
    }

    setState(() => _isLoading = true);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool("loggedIn", true);

      if (!mounted) return;
      Navigator.pushReplacementNamed(context, "/home");
    } on FirebaseAuthException catch (e) {
      _showMessage(e.message ?? "Login failed");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // -------------------------------------------------------
  // GOOGLE SIGN-IN
  // -------------------------------------------------------
  Future<void> _handleGoogleSignIn() async {
    setState(() => _isLoading = true);

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        setState(() => _isLoading = false);
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool("loggedIn", true);

      if (!mounted) return;
      Navigator.pushReplacementNamed(context, "/home");
    } catch (e) {
      _showMessage("Google Sign-In failed.");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // -------------------------------------------------------
  // PASSWORD RESET
  // -------------------------------------------------------
  Future<void> _handleForgotPassword() async {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      _showMessage("Enter your email first.");
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      _showMessage("Password reset link sent to $email");
    } catch (e) {
      _showMessage("Unable to send reset email.");
    }
  }

  // -------------------------------------------------------
  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final logoSize = screenWidth * 0.2 > 80 ? 80.0 : screenWidth * 0.2;
    final iconSize = logoSize * 0.6;
    final cardMaxWidth = screenWidth * 0.9 < 450 ? screenWidth * 0.9 : 450.0;

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenWidth * 0.1),

                  // ----------- MAIN CARD -------------
                  Container(
                    constraints: BoxConstraints(maxWidth: cardMaxWidth),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF7EC8E3), Color(0xFF5AB4D8)],
                      ),
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(50),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // HEADER
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.08),
                          child: Column(
                            children: [
                              const Text(
                                'Welcome to',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'CodeQuest',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 16),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: logoSize,
                                    height: logoSize,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withAlpha(25),
                                          blurRadius: 10,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      Icons.school,
                                      size: iconSize,
                                      color: const Color.fromRGBO(
                                          52, 141, 188, 1),
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.05),
                                  Container(
                                    width: logoSize,
                                    height: logoSize,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withAlpha(25),
                                          blurRadius: 10,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      Icons.computer,
                                      size: iconSize,
                                      color: const Color.fromRGBO(
                                          52, 141, 188, 1),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 16),

                              Text(
                                'Learn Mobile App Development',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white.withAlpha(230),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // -------- LOGIN FORM --------
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(32)),
                          ),
                          padding: EdgeInsets.all(screenWidth * 0.08),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1A1A1A),
                                ),
                              ),
                              SizedBox(height: screenWidth * 0.03),

                              const Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF666666),
                                ),
                              ),
                              SizedBox(height: screenWidth * 0.01),
                              CustomTextField(
                                controller: _emailController,
                                hintText: 'your@email.com',
                                prefixIcon: Icons.email_outlined,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: screenWidth * 0.025),

                              const Text(
                                'Password',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF666666),
                                ),
                              ),
                              SizedBox(height: screenWidth * 0.01),
                              CustomTextField(
                                controller: _passwordController,
                                hintText: '••••••••',
                                prefixIcon: Icons.lock_outline,
                                isPassword: true,
                              ),
                              SizedBox(height: screenWidth * 0.015),

                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () { _handleForgotPassword(); },
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      color: Color.fromRGBO(52, 141, 188, 1),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: screenWidth * 0.015),

                              // EMAIL LOGIN BUTTON
                              GradientButton(
                                text: _isLoading ? "Loading..." : "Login",
                                onPressed: () {
                                  if (_isLoading) return;
                                  _handleEmailLogin();
                                },
                              ),
                              SizedBox(height: screenWidth * 0.03),

                              // DIVIDER
                              Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      color: Colors.grey.shade300,
                                      thickness: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Text(
                                      'or',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      color: Colors.grey.shade300,
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenWidth * 0.03),

                              // GOOGLE SIGN IN BUTTON
                              OutlinedButton(
                                onPressed: _isLoading
                                    ? null
                                    : () { _handleGoogleSignIn(); },
                                style: OutlinedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 56),
                                  side: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 1.5,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      'https://www.google.com/favicon.ico',
                                      width: 24,
                                      height: 24,
                                    ),
                                    const SizedBox(width: 12),
                                    const Text(
                                      'Continue with Google',
                                      style: TextStyle(
                                        color: Color(0xFF1A1A1A),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: screenWidth * 0.03),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account? ",
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 14,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.pushNamed(
                                        context, '/signup'),
                                    child: const Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        color: Color.fromRGBO(52, 141, 188, 1),
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
                      ],
                    ),
                  ),

                  SizedBox(height: screenWidth * 0.1),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
