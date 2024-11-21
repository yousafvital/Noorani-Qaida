import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:manzil_offline/custom_widgets/makhraj_widget.dart';

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
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10.0),
            child: TabBar(
              labelColor: Colors.white,
              labelStyle: const TextStyle(fontSize: 22),
              indicatorColor: Colors.orangeAccent,
              indicator: BoxDecoration(
                color: Colors.blue, // Color of the indicator
                borderRadius: BorderRadius.circular(10), // Rounded corners for the indicator
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(text: 'MAKHRAJ'),
                Tab(text: 'MAP'),
              ],
            ),
          ),
        ),
        body: TabBarView(children: [
          ListView(
            children: [
              MakhrajWidget(
                title: '1. The Makhraj of ALIF',
                subTitle: 'subTitle',
                trailing: IconButton(
                  icon: Icon(Icons.multitrack_audio_outlined),
                  onPressed: () {
                    playAudio('assets/audio/voice_l1/l1.mp3'); // Play audio on click
                  },
                ),
              ),
              Divider(),
              MakhrajWidget(
                title: '2. The Makhraj of HAMZAH-HAA',
                subTitle: 'subTitle',
                trailing: IconButton(
                  icon: Icon(Icons.multitrack_audio_outlined),
                  onPressed: () {
                    playAudio('assets/audio/voice_l1/l2.mp3');
                  },
                ),
              ),
              Divider(),
              MakhrajWidget(
                title: '3. The Makhraj of AIN-HAA',
                subTitle: 'subTitle',
                trailing: IconButton(
                  icon: Icon(Icons.multitrack_audio_outlined),
                  onPressed: () {
                    playAudio('assets/audio/voice_l1/l3.mp3');
                  },
                ),
              ),
              Divider(),
              MakhrajWidget(
                title: '1. The Makhraj of ALIF',
                subTitle: 'subTitle',
                trailing: IconButton(
                  icon: Icon(Icons.multitrack_audio_outlined),
                  onPressed: () {
                    playAudio('assets/audio/voice_l1/l1.mp3'); // Play audio on click
                  },
                ),
              ),
              Divider(),
              MakhrajWidget(
                title: '2. The Makhraj of HAMZAH-HAA',
                subTitle: 'subTitle',
                trailing: IconButton(
                  icon: Icon(Icons.multitrack_audio_outlined),
                  onPressed: () {
                    playAudio('assets/audio/voice_l1/l2.mp3');
                  },
                ),
              ),
              Divider(),
              MakhrajWidget(
                title: '3. The Makhraj of AIN-HAA',
                subTitle: 'subTitle',
                trailing: IconButton(
                  icon: Icon(Icons.multitrack_audio_outlined),
                  onPressed: () {
                    playAudio('assets/audio/voice_l1/l3.mp3');
                  },
                ),
              ),
              Divider(),
              MakhrajWidget(
                title: '1. The Makhraj of ALIF',
                subTitle: 'subTitle',
                trailing: IconButton(
                  icon: Icon(Icons.multitrack_audio_outlined),
                  onPressed: () {
                    playAudio('assets/audio/voice_l1/l1.mp3'); // Play audio on click
                  },
                ),
              ),
              Divider(),
              MakhrajWidget(
                title: '2. The Makhraj of HAMZAH-HAA',
                subTitle: 'subTitle',
                trailing: IconButton(
                  icon: Icon(Icons.multitrack_audio_outlined),
                  onPressed: () {
                    playAudio('assets/audio/voice_l1/l2.mp3');
                  },
                ),
              ),
              Divider(),
              MakhrajWidget(
                title: '3. The Makhraj of AIN-HAA',
                subTitle: 'subTitle',
                trailing: IconButton(
                  icon: Icon(Icons.multitrack_audio_outlined),
                  onPressed: () {
                    playAudio('assets/audio/voice_l1/l3.mp3');
                  },
                ),
              ),
              Divider(),
              MakhrajWidget(
                title: '1. The Makhraj of ALIF',
                subTitle: 'subTitle',
                trailing: IconButton(
                  icon: Icon(Icons.multitrack_audio_outlined),
                  onPressed: () {
                    playAudio('assets/audio/voice_l1/l1.mp3'); // Play audio on click
                  },
                ),
              ),
              Divider(),
              MakhrajWidget(
                title: '2. The Makhraj of HAMZAH-HAA',
                subTitle: 'subTitle',
                trailing: IconButton(
                  icon: Icon(Icons.multitrack_audio_outlined),
                  onPressed: () {
                    playAudio('assets/audio/voice_l1/l2.mp3');
                  },
                ),
              ),
              Divider(),
              MakhrajWidget(
                title: '3. The Makhraj of AIN-HAA',
                subTitle: 'subTitle',
                trailing: IconButton(
                  icon: Icon(Icons.multitrack_audio_outlined),
                  onPressed: () {
                    playAudio('assets/audio/voice_l1/l3.mp3');
                  },
                ),
              ),
              Divider(),
              MakhrajWidget(
                title: '1. The Makhraj of ALIF',
                subTitle: 'subTitle',
                trailing: IconButton(
                  icon: Icon(Icons.multitrack_audio_outlined),
                  onPressed: () {
                    playAudio('assets/audio/voice_l1/l1.mp3'); // Play audio on click
                  },
                ),
              ),
              Divider(),
              MakhrajWidget(
                title: '2. The Makhraj of HAMZAH-HAA',
                subTitle: 'subTitle',
                trailing: IconButton(
                  icon: Icon(Icons.multitrack_audio_outlined),
                  onPressed: () {
                    playAudio('assets/audio/voice_l1/l2.mp3');
                  },
                ),
              ),
              Divider(),
              MakhrajWidget(
                title: '3. The Makhraj of AIN-HAA',
                subTitle: 'subTitle',
                trailing: IconButton(
                  icon: Icon(Icons.multitrack_audio_outlined),
                  onPressed: () {
                    playAudio('assets/audio/voice_l1/l3.mp3');
                  },
                ),
              ),
              Divider(),
              MakhrajWidget(
                title: '1. The Makhraj of ALIF',
                subTitle: 'subTitle',
                trailing: IconButton(
                  icon: Icon(Icons.multitrack_audio_outlined),
                  onPressed: () {
                    playAudio('assets/audio/voice_l1/l1.mp3'); // Play audio on click
                  },
                ),
              ),
              Divider(),
              MakhrajWidget(
                title: '2. The Makhraj of HAMZAH-HAA',
                subTitle: 'subTitle',
                trailing: IconButton(
                  icon: Icon(Icons.multitrack_audio_outlined),
                  onPressed: () {
                    playAudio('assets/audio/voice_l1/l2.mp3');
                  },
                ),
              ),
              Divider(),
              MakhrajWidget(
                title: '3. The Makhraj of AIN-HAA',
                subTitle: 'subTitle',
                trailing: IconButton(
                  icon: Icon(Icons.multitrack_audio_outlined),
                  onPressed: () {
                    playAudio('assets/audio/voice_l1/l3.mp3');
                  },
                ),
              ),
              // Add more MakhrajWidget as needed, following the same pattern
            ],
          ),
          Expanded(child: Image(image: AssetImage('assets/images/rules_img.jpg'))),
        ]),
      ),
    );
  }
}
