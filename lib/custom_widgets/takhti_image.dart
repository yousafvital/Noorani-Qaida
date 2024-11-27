import 'package:flutter/material.dart';

class TakhtiImage extends StatelessWidget {
  final String text;

  const TakhtiImage({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, // Center the text on the image
      children: [
        Container(
          height: 90, // Set desired height
          width: double.infinity, // Make it as wide as the parent
          child: Image.asset(
            'assets/images/takhti_title.png',
            fit: BoxFit.cover, // Adjust this to how you want the image scaled
          ),
        ),
        Positioned(
          bottom: 22, // Adjust text positioning based on the image size
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Noori',
            ),
          ),
        ),
      ],
    );
  }
}
