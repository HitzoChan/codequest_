import 'package:flutter/material.dart';

class SmoothPageRoute extends PageRouteBuilder {
  final Widget page;

  SmoothPageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Pure fade transition
            const curve = Curves.easeInOut;

            var fadeTween = Tween<double>(begin: 0.0, end: 1.0).chain(
              CurveTween(curve: curve),
            );
            var fadeAnimation = animation.drive(fadeTween);

            return FadeTransition(
              opacity: fadeAnimation,
              child: child,
            );
          },
        );
}
