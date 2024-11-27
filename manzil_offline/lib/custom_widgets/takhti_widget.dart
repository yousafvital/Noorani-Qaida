import 'package:flutter/material.dart';

class TakhtiWidget extends StatelessWidget {
  final String text;

  const TakhtiWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, // Center the text on the image
      children: [
        SizedBox(
          height: 80,
          width: double.infinity, // Use full width of the parent
          child: Image.asset(
            'assets/images/title_img.jpeg',
            fit: BoxFit.fill, // Ensure the image covers the container
          ),
        ),
        Positioned(
          bottom: 15,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              fontFamily: 'Noori',
            ),
          ),
        ),
      ],
    );
  }
}
