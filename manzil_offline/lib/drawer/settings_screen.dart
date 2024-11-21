import 'package:flutter/material.dart';
import 'package:manzil_offline/custom_widgets/app_drawer.dart';
import 'package:manzil_offline/custom_widgets/appbar_widget.dart';
import 'package:provider/provider.dart';
import 'package:manzil_offline/custom_widgets/audio_controller.dart';
import 'package:manzil_offline/custom_widgets/takhti_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the AudioController from the provider
    final audioController = Provider.of<AudioController>(context);

    return Scaffold(
      appBar: AppbarWidget(title: 'نورانی قاعدہ'),
      endDrawer: AppDrawer(),
      body: Column(
        children: [
          TakhtiWidget(text: 'Settings'),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                const Icon(Icons.settings_voice_outlined, size: 40),
                const Text('Tawuz Sound', style: TextStyle(fontSize: 25)),
                const Spacer(),
                Switch(
                  value: audioController.isAudioEnabled,
                  activeColor: Colors.orangeAccent,
                  onChanged: (bool value) {
                    // Toggle the global audio state
                    audioController.setAudioEnabled(value);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
