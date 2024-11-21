import 'package:flutter/material.dart';
import 'package:manzil_offline/custom_widgets/app_drawer.dart';
import 'package:manzil_offline/custom_widgets/appbar_widget.dart';
import 'package:manzil_offline/custom_widgets/takhti_widget.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  // Track the visibility of each section
  List<bool> _isVisible = [false, false, false, false, false];

  @override
  void initState() {
    super.initState();
    _animateText();
  }

  // Delay animation for each text section
  void _animateText() async {
    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isVisible[0] = true;
      });
    });

    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isVisible[1] = true;
      });
    });

    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isVisible[2] = true;
      });
    });

    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isVisible[3] = true;
      });
    });

    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isVisible[4] = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: 'نورانی قاعدہ'),
      endDrawer: AppDrawer(),
      body: Stack(
        children: [
          // Background image covering the entire screen
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/book.jpg'), // Change this to your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
          ),
          // Main content
          Column(
            children: [
              // This text will not scroll
              const TakhtiWidget(text: 'About'),

              // Expanded widget to allow scrolling for the content
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Single padding for all text widgets
                    child: Column(
                      children: [
                        // First text with fade-in animation
                        AnimatedOpacity(
                          opacity: _isVisible[0] ? 1.0 : 0.0,
                          duration: const Duration(seconds: 1),
                          child: Text(
                            'Transforming Business with Mobile Development Excellence',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                        ),
                        // Second text with fade-in animation
                        AnimatedOpacity(
                          opacity: _isVisible[1] ? 1.0 : 0.0,
                          duration: const Duration(seconds: 1),
                          child: Text(
                            'At Vital Steer, our team of seasoned mobile developers is dedicated to enhancing your mobile presence with powerful Android and iOS applications. We focus on creating seamless, intuitive, and high-performance apps that meet your business objectives and captivate users. With a commitment to innovative design, optimized performance, and end-to-end support, we deliver solutions that drive engagement, growth, and lasting value.',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        // Third text with fade-in animation
                        AnimatedOpacity(
                          opacity: _isVisible[2] ? 1.0 : 0.0,
                          duration: const Duration(seconds: 1),
                          child: Text(
                            'Our Mission',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                        ),
                        // Fourth text with fade-in animation
                        AnimatedOpacity(
                          opacity: _isVisible[3] ? 1.0 : 0.0,
                          duration: const Duration(seconds: 1),
                          child: Text(
                            'To shape the future of mobile experiences by combining innovation with expertise. We empower businesses to engage their audience, scale effortlessly, and thrive in a competitive landscape.',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        // Fifth text with fade-in animation
                        AnimatedOpacity(
                          opacity: _isVisible[4] ? 1.0 : 0.0,
                          duration: const Duration(seconds: 1),
                          child: Text(
                            'Custom Code',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                        ),
                        // Sixth text with fade-in animation
                        AnimatedOpacity(
                          opacity: _isVisible[4] ? 1.0 : 0.0,
                          duration: const Duration(seconds: 1),
                          child: Text(
                            'Delivering mobile solutions that connect people and ideas. Vital Steer brings passion, creativity, and technical excellence to every project.',
                            style: TextStyle(fontSize: 18, color: Colors.white),
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
