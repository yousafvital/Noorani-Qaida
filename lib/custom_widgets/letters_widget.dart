import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LettersWidget extends StatelessWidget {
  const LettersWidget({super.key, required this.svgImage, this.color = Colors.white});

  final String svgImage;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(

        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: color,
            borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            svgImage,
          ),
        ),
      ),
    );
  }
}
