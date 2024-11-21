import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:manzil_offline/drawer/about_screen.dart';
import 'package:manzil_offline/drawer/rules_screen.dart';
import 'package:manzil_offline/drawer/settings_screen.dart';
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
                color: Colors.blue, // Retain orange accent for the header
              ),
              child: Center(
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Noori',
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Rules',
                style: TextStyle(fontSize: 22),
              ),
              trailing: const Icon(
                Icons.rule_sharp,
                size: 35,
              ),
              onTap: () {
                Get.to(const RulesScreen());
              },
            ),
            ListTile(
              title: const Text(
                'About',
                style: TextStyle(fontSize: 22),
              ),
              trailing: const Icon(
                Icons.question_mark_sharp,
                size: 35,
              ),
              onTap: () {
                Get.to(const AboutScreen());
              },
            ),
            ListTile(
              title: const Text(
                'Share',
                style: TextStyle(fontSize: 22),
              ),
              trailing: const Icon(
                Icons.share,
                size: 35,
              ),
              onTap: () {
                Share.share('com.example.manzil_offline');
              },
            ),
            ListTile(
              title: const Text(
                'Settings',
                style: TextStyle(fontSize: 22),
              ),
              trailing: const Icon(
                Icons.settings,
                size: 35,
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
