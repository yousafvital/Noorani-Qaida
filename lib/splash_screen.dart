import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manzil_offline/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // Fade-in animation for the book image
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    // Start animation
    _controller.forward();

    Timer(const Duration(seconds: 5), () {
      Get.to(const HomeScreen());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade900, // A soothing Islamic-themed color
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [Colors.teal.shade900, Colors.teal.shade600],
                  center: Alignment.center,
                  radius: 0.8,
                ),
              ),
            ),
          ),

          // Sparkle animation (optional for subtle decoration)
          Positioned.fill(
            child: CustomPaint(
              painter: SparklePainter(),
            ),
          ),

          // Center content
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Image of Noorani Qaida
                  Image.asset(
                    'assets/images/book.jpg',
                    height: 200,
                  ),
                  const SizedBox(height: 20),

                  // Title
                  Text(
                    'نورانی قاعدہ',
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Noori',
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Subtitle/Tagline
                  Text(
                    'Learn the foundations of Quranic reading',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Optional: SparklePainter for subtle sparkle effect
class SparklePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    // Create sparkles
    for (var i = 0; i < 20; i++) {
      final dx = size.width * (i / 20);
      final dy = size.height * (i % 2 == 0 ? 0.3 : 0.7);
      final radius = 5.0 + i % 3;
      canvas.drawCircle(Offset(dx, dy), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
