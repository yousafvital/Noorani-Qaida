import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manzil_offline/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:manzil_offline/custom_widgets/audio_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AudioController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
