import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:manzil_offline/custom_widgets/app_data.dart';
import 'package:manzil_offline/custom_widgets/app_drawer.dart';
import 'package:manzil_offline/custom_widgets/appbar_widget.dart';
import 'package:manzil_offline/dashboard_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> appData = [];

  @override
  void initState() {
    super.initState();
    // Fetch app data from AppDataProvider
    appData = AppDataProvider.getAppData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: 'نورانی قاعدہ',
      ),
      endDrawer: AppDrawer(),
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: appData.length,
          itemBuilder: (context, index) {
            final mainData = appData[index];
            final screenPath = mainData['screenImage'];
            final screenNumber = mainData['no'];

            return AnimationConfiguration.staggeredList(
              position: index,
              delay: const Duration(milliseconds: 200), // Adjusted delay
              child: SlideAnimation(
                horizontalOffset: 150.0,
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 800), // Animation duration
                child: FadeInAnimation(
                  duration: const Duration(milliseconds: 800),
                  child: GestureDetector(
                    onTap: () => Get.to(
                      DashboardScreen(screenNumber: screenNumber),
                    ),
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            screenPath,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 180,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
