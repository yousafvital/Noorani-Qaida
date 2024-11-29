import 'package:flutter/material.dart';

class MakhrajWidget extends StatelessWidget {
  const MakhrajWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.trailing, // Change the type to Widget
  });

  final String title;
  final String subTitle;
  final Widget trailing; // Changed to Widget

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subTitle,
        style: const TextStyle(fontSize: 15),
      ),
      trailing: trailing, // Now accepts any Widget
    );
  }
}
