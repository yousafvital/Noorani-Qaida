import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:manzil_offline/drawer/about_screen.dart';
import 'package:manzil_offline/drawer/rules_screen.dart';
import 'package:manzil_offline/drawer/settings_screen.dart';
import 'package:manzil_offline/home_screen.dart';
import 'package:share_plus/share_plus.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white, // Set the background color to white
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 0, 49, 47), // Start color
                    Color.fromARGB(255, 0, 49, 47), // Start color
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Text(
                  'نورانی قاعدہ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Noori',
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Noori',
                  color: Colors.teal,
                ),
              ),
              trailing: const Icon(
                Icons.home_outlined,
                size: 30,
                color: Colors.teal,
              ),
              onTap: () {
                Get.to(const HomeScreen());
              },
            ),
            ListTile(
              title: const Text(
                'Rules',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Noori',
                  color: Colors.teal,
                ),
              ),
              trailing: const Icon(
                Icons.rule_sharp,
                size: 30,
                color: Colors.teal,
              ),
              onTap: () {
                Get.to(const RulesScreen());
              },
            ),
            ListTile(
              title: const Text(
                'About',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Noori',
                  color: Colors.teal,
                ),
              ),
              trailing: const Icon(
                Icons.info_outline,
                size: 30,
                color: Colors.teal,
              ),
              onTap: () {
                Get.to(const AboutScreen());
              },
            ),
            ListTile(
              title: const Text(
                'Share',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Noori',
                  color: Colors.teal,
                ),
              ),
              trailing: const Icon(
                Icons.share_outlined,
                size: 30,
                color: Colors.teal,
              ),
              onTap: () {
                Share.share('com.example.manzil_offline');
              },
            ),
            ListTile(
              title: const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Noori',
                  color: Colors.teal,
                ),
              ),
              trailing: const Icon(
                Icons.display_settings_outlined,
                size: 30,
                color: Colors.teal,
              ),
              onTap: () {
                Get.to(const SettingsScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
