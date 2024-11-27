import 'package:flutter/material.dart';
import 'package:manzil_offline/custom_widgets/app_drawer.dart';
import 'package:manzil_offline/custom_widgets/appbar_widget.dart';
import 'package:manzil_offline/custom_widgets/takhti_image.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  List<bool> _isVisible = [false, false, false, false, false];

  @override
  void initState() {
    super.initState();
    // Start the fade-in animations after a delay
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isVisible[0] = true;
      });
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isVisible[1] = true;
      });
    });
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isVisible[2] = true;
      });
    });
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _isVisible[3] = true;
      });
    });
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _isVisible[4] = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'نورانی قاعدہ'),
      endDrawer: const AppDrawer(),
      body: Stack(
        children: [
          // Background image with opacity
          Positioned.fill(
            child: Opacity(
              opacity: 0.3, // Adjust opacity as needed
              child: Image.asset(
                'assets/images/custom_quran.png', // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content of the About Screen
          Column(
            children: [
              const TakhtiImage(text: 'About'),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10), // Single padding for all text widgets
                    child: Column(
                      children: [
                        // First text with fade-in animation
                        AnimatedOpacity(
                          opacity: _isVisible[0] ? 1.0 : 0.0,
                          duration: const Duration(seconds: 1),
                          child: const Text(
                            'Transforming Business with Mobile Development Excellence',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                                fontFamily: 'Noori'),
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Second text with fade-in animation
                        AnimatedOpacity(
                          opacity: _isVisible[1] ? 1.0 : 0.0,
                          duration: const Duration(seconds: 1),
                          child: const Text(
                            'At Vital Steer, our team of seasoned mobile developers is dedicated to enhancing your mobile presence with powerful Android and iOS applications. We focus on creating seamless, intuitive, and high-performance apps that meet your business objectives and captivate users. With a commitment to innovative design, optimized performance, and end-to-end support, we deliver solutions that drive engagement, growth, and lasting value.',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Third text with fade-in animation
                        AnimatedOpacity(
                          opacity: _isVisible[2] ? 1.0 : 0.0,
                          duration: const Duration(seconds: 1),
                          child: const Text(
                            'Our Mission',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                                fontFamily: 'Noori'),
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Fourth text with fade-in animation
                        AnimatedOpacity(
                          opacity: _isVisible[3] ? 1.0 : 0.0,
                          duration: const Duration(seconds: 1),
                          child: const Text(
                            'To shape the future of mobile experiences by combining innovation with expertise. We empower businesses to engage their audience, scale effortlessly, and thrive in a competitive landscape.',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Fifth text with fade-in animation
                        AnimatedOpacity(
                          opacity: _isVisible[4] ? 1.0 : 0.0,
                          duration: const Duration(seconds: 1),
                          child: const Text(
                            'Custom Code',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                                fontFamily: 'Noori'),
                          ),
                        ),
                        // Sixth text with fade-in animation
                        AnimatedOpacity(
                          opacity: _isVisible[4] ? 1.0 : 0.0,
                          duration: const Duration(seconds: 1),
                          child: const Text(
                            'Delivering mobile solutions that connect people and ideas. Vital Steer brings passion, creativity, and technical excellence to every project.',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
