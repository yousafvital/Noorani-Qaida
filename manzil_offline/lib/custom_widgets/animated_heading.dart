import 'package:flutter/material.dart';

class AnimatedHeading extends StatefulWidget {
  @override
  _AnimatedHeadingState createState() => _AnimatedHeadingState();
}

class _AnimatedHeadingState extends State<AnimatedHeading> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Delay to start the animation
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _opacity = 1.0; // Change opacity to fully visible
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: Duration(seconds: 2), // Animation duration
        child: Text(
          'Transforming Business with Mobile Development Excellence',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
