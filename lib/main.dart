import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'package:get/get.dart';
import 'package:manzil_offline/home_screen.dart';
import 'package:manzil_offline/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:manzil_offline/custom_widgets/audio_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Set your design dimensions here
      minTextAdapt: true, // Adapts text scaling to screen size
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(), // Initial screen of your app
        );
      },
    );
  }
}
