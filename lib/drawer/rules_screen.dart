import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:manzil_offline/custom_widgets/app_drawer.dart';
import 'package:manzil_offline/custom_widgets/makhraj_widget.dart';
import 'package:manzil_offline/custom_widgets/appbar_widget.dart';
import '../custom_widgets/youtube_player.dart'; // Import your custom app bar widget

class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key});

  // Method to play audio
  Future<void> playAudio(String audioAsset) async {
    final player = AudioPlayer();
    await player.setAsset(audioAsset); // Set the audio asset
    player.play(); // Play the audio
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        endDrawer: const AppDrawer(),
        body: Stack(
          children: [
            // Background image with opacity
            Positioned.fill(
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  'assets/images/custom_quran.png', // Your background image path
                  fit: BoxFit
                      .cover, // Ensures the image covers the entire screen
                ),
              ),
            ),
            Column(
              children: [
                // Your custom app bar
                const AppbarWidget(
                  title: 'نورانی قاعدہ',
                  // Add any additional customization for your app bar here
                ),
                // TabBar with custom styling
                Container(
                  color: Colors.white,
                  height: 40, // Background color for the tab bar
                  child: const TabBar(
                    labelColor: Colors.white,
                    labelStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Noori',
                      fontWeight: FontWeight.bold,
                    ),
                    indicator: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 0, 49, 47), // Start color
                          Color.fromARGB(255, 0, 49, 47), // Start color
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(text: 'Makhraj'),
                      Tab(text: 'Map'),
                      Tab(text: 'Pronunciation'),
                    ],
                  ),
                ),
                Expanded(
                  // Expanded TabBarView
                  child: TabBarView(
                    children: [
                      ListView(
                        children: [
                          MakhrajWidget(
                            title: '1. The Makhraj of ALIF',
                            subTitle:
                                'Alif comes out the empty space of the mouth.',
                            trailing: IconButton(
                              icon: const Icon(Icons.multitrack_audio_outlined),
                              onPressed: () {
                                playAudio('assets/audio/voice_l1/l1.mp3');
                              },
                            ),
                          ),
                          const Divider(),
                          MakhrajWidget(
                            title: '2. The Makhraj of ALIF',
                            subTitle:
                                'Alif comes out the empty space of the mouth.',
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.multitrack_audio_outlined,
                              ),
                              onPressed: () {
                                playAudio('assets/audio/voice_l1/l1.mp3');
                              },
                            ),
                          ),
                          const Divider(),
                          MakhrajWidget(
                            title: '3. The Makhraj of ALIF',
                            subTitle:
                                'Alif comes out the empty space of the mouth.',
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.multitrack_audio_outlined,
                              ),
                              onPressed: () {
                                playAudio('assets/audio/voice_l1/l1.mp3');
                              },
                            ),
                          ),
                          const Divider(),
                          MakhrajWidget(
                            title: '4. The Makhraj of ALIF',
                            subTitle:
                                'Alif comes out the empty space of the mouth.',
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.multitrack_audio_outlined,
                              ),
                              onPressed: () {
                                playAudio('assets/audio/voice_l1/l1.mp3');
                              },
                            ),
                          ),
                          const Divider(),
                          MakhrajWidget(
                            title: '5. The Makhraj of ALIF',
                            subTitle:
                                'Alif comes out the empty space of the mouth.',
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.multitrack_audio_outlined,
                              ),
                              onPressed: () {
                                playAudio('assets/audio/voice_l1/l1.mp3');
                              },
                            ),
                          ),
                          const Divider(),
                          MakhrajWidget(
                            title: '6. The Makhraj of ALIF',
                            subTitle:
                                'Alif comes out the empty space of the mouth.',
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.multitrack_audio_outlined,
                              ),
                              onPressed: () {
                                playAudio('assets/audio/voice_l1/l1.mp3');
                              },
                            ),
                          ),
                          const Divider(),
                          MakhrajWidget(
                            title: '7. The Makhraj of ALIF',
                            subTitle:
                                'Alif comes out the empty space of the mouth.',
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.multitrack_audio_outlined,
                              ),
                              onPressed: () {
                                playAudio('assets/audio/voice_l1/l1.mp3');
                              },
                            ),
                          ),
                          const Divider(),
                          MakhrajWidget(
                            title: '8. The Makhraj of ALIF',
                            subTitle:
                                'Alif comes out the empty space of the mouth.',
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.multitrack_audio_outlined,
                              ),
                              onPressed: () {
                                playAudio('assets/audio/voice_l1/l1.mp3');
                              },
                            ),
                          ),
                          const Divider(),
                          MakhrajWidget(
                            title: '9. The Makhraj of ALIF',
                            subTitle:
                                'Alif comes out the empty space of the mouth.',
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.multitrack_audio_outlined,
                              ),
                              onPressed: () {
                                playAudio('assets/audio/voice_l1/l1.mp3');
                              },
                            ),
                          ),
                          const Divider(),
                          MakhrajWidget(
                            title: '10. The Makhraj of ALIF',
                            subTitle:
                                'Alif comes out the empty space of the mouth.',
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.multitrack_audio_outlined,
                              ),
                              onPressed: () {
                                playAudio('assets/audio/voice_l1/l1.mp3');
                              },
                            ),
                          ),
                          const Divider(),
                          MakhrajWidget(
                            title: '11. The Makhraj of ALIF',
                            subTitle:
                                'Alif comes out the empty space of the mouth.',
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.multitrack_audio_outlined,
                              ),
                              onPressed: () {
                                playAudio('assets/audio/voice_l1/l1.mp3');
                              },
                            ),
                          ),
                          const Divider(),
                          MakhrajWidget(
                            title: '12. The Makhraj of ALIF',
                            subTitle:
                                'Alif comes out the empty space of the mouth.',
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.multitrack_audio_outlined,
                              ),
                              onPressed: () {
                                playAudio('assets/audio/voice_l1/l1.mp3');
                              },
                            ),
                          ),
                          const Divider(),
                          MakhrajWidget(
                            title: '13. The Makhraj of ALIF',
                            subTitle:
                                'Alif comes out the empty space of the mouth.',
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.multitrack_audio_outlined,
                              ),
                              onPressed: () {
                                playAudio('assets/audio/voice_l1/l1.mp3');
                              },
                            ),
                          ),
                          const Divider(),
                          MakhrajWidget(
                            title: '14. The Makhraj of ALIF',
                            subTitle:
                                'Alif comes out the empty space of the mouth.',
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.multitrack_audio_outlined,
                              ),
                              onPressed: () {
                                playAudio('assets/audio/voice_l1/l1.mp3');
                              },
                            ),
                          ),
                          const Divider(),
                          MakhrajWidget(
                            title: '15. The Makhraj of ALIF',
                            subTitle:
                                'Alif comes out the empty space of the mouth.',
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.multitrack_audio_outlined,
                              ),
                              onPressed: () {
                                playAudio('assets/audio/voice_l1/l1.mp3');
                              },
                            ),
                          ),
                          const Divider(),
                          MakhrajWidget(
                            title: '16. The Makhraj of ALIF',
                            subTitle:
                                'Alif comes out the empty space of the mouth.',
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.multitrack_audio_outlined,
                              ),
                              onPressed: () {
                                playAudio('assets/audio/voice_l1/l1.mp3');
                              },
                            ),
                          ),
                          const Divider(),
                          MakhrajWidget(
                            title: '17. The Makhraj of ALIF',
                            subTitle:
                                'Alif comes out the empty space of the mouth.',
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.multitrack_audio_outlined,
                              ),
                              onPressed: () {
                                playAudio('assets/audio/voice_l1/l1.mp3');
                              },
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Image.asset('assets/images/rules_img.jpg'),
                      ),
                      Center(
                        child: YoutubePlayerWidget(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
