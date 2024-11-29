import 'package:flutter/material.dart';
import 'package:manzil_offline/custom_widgets/app_drawer.dart';
import 'package:manzil_offline/custom_widgets/appbar_widget.dart';
import 'package:manzil_offline/custom_widgets/takhti_image.dart';
import 'package:provider/provider.dart';
import 'package:manzil_offline/custom_widgets/audio_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the AudioController from the provider
    // final audioController = Provider.of<AudioController>(context);

    return Scaffold(
      appBar: const AppbarWidget(title: 'نورانی قاعدہ'),
      endDrawer: const AppDrawer(),
      body: Stack(
        children: [
          // Background image with opacity
          Positioned.fill(
            child: Opacity(
              opacity: 0.7, // Adjust opacity as needed
              child: Center(
                child: Image.asset(
                  'assets/images/quran_bg.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Content of the Settings Screen
          Column(
            children: [
              const TakhtiImage(text: 'Setting'),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.audiotrack_outlined,
                      size: 30,
                      color: Colors.green,
                    ),
                    const Text('Recitation',
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Noori',
                        )),
                    const Spacer(),
                    // Switch(
                    //   value: audioController.isAudioEnabled,
                    //   activeColor: Colors.deepOrangeAccent,
                    //   onChanged: (bool value) {
                    //     // Toggle the global audio state
                    //     audioController.setAudioEnabled(value);
                    //   },
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
