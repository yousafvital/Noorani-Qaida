import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:manzil_offline/custom_widgets/audio_controller.dart';
import 'package:manzil_offline/custom_widgets/letters_widget.dart';
import 'package:manzil_offline/custom_widgets/takhti_widget.dart';

class CustomScreen extends StatefulWidget {
  final String title;
  final String hadayat;
  final List<Map<String, String>> gridItems;
  final String screenPath;
  final VoidCallback?
      onLastItemVisible; // Callback to trigger when the last item is visible

  const CustomScreen({
    Key? key,
    required this.title,
    required this.hadayat,
    required this.gridItems,
    required this.screenPath,
    this.onLastItemVisible, // Initialize the callback
  }) : super(key: key);

  @override
  _CustomScreenState createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int currentPlayingIndex = -1;
  bool isPlayingAll = false;
  late PageController _pageController;

  Future<void> playAudio(int index) async {
    if (!AudioController().isAudioEnabled) {
      return;
    }

    // Stop "Play All" if it's running
    if (isPlayingAll) {
      stopAudio();
    }

    final audioPath = widget.gridItems[index]['audioPath'];
    if (audioPath != null) {
      try {
        setState(() {
          currentPlayingIndex = index;
        });
        print("---> Play once $currentPlayingIndex and $index");

        await _audioPlayer.setAsset(audioPath);
        await _audioPlayer.play();

        print("---> Play once $currentPlayingIndex and $index");

        // Listen for playback completion
        _audioPlayer.playerStateStream.listen((state) {
          if (state.processingState == ProcessingState.completed) {
            setState(() {
              //currentPlayingIndex = -1;
              print("Play once progress completed");
            });
          }
        });
      } catch (e) {
        print("Error playing audio: $e");
      }
    }
  }

  Future<void> playAllAudio(int startIndex) async {
    if (!AudioController().isAudioEnabled) {
      return;
    }

    isPlayingAll = true; // Ensure the flag is set when this function starts.

    for (int i = startIndex; i < widget.gridItems.length; i++) {
      // Exit the loop if isPlayingAll is false
      if (!isPlayingAll) {
        break;
      }

      final audioPath = widget.gridItems[i]['audioPath'];
      if (audioPath != null) {
        try {
          setState(() {
            currentPlayingIndex = i;
          });
          print('---> In play all loop $currentPlayingIndex and $i');

          await _audioPlayer.setAsset(audioPath);
          await _audioPlayer.play();

          // Wait until the current audio finishes playing or is interrupted
          await _audioPlayer.playerStateStream.firstWhere(
              (state) => state.processingState == ProcessingState.completed);
        } catch (e) {
          print("Error playing audio: $e");
          break; // Break the loop on error
        }
      }
    }

    // Reset the state after exiting the loop
    setState(() {
      isPlayingAll = false;
      currentPlayingIndex = -1;
      print('Play all on state  currentPlayingIndex = -1 $currentPlayingIndex');

      // Trigger the callback if it's the last item
      if (widget.onLastItemVisible != null &&
          startIndex == widget.gridItems.length - 1) {
        widget.onLastItemVisible!();
      }
    });
  }

  // Stop audio
  void stopAudio() {
    _audioPlayer.stop();
    setState(() {
      //currentPlayingIndex = -1;
      print('stopAudio setState  currentPlayingIndex = -1 $currentPlayingIndex');
      isPlayingAll = false;
    });
  }

  // Initialize the PageController for page navigation
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _pageController
        .dispose(); // Dispose of the page controller when the widget is disposed
    super.dispose();
  }

  // Handle page navigation (go to next screen)
  void _goToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TakhtiWidget(text: widget.title),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  isPlayingAll ? Icons.pause : Icons.play_arrow,
                  size: 40,
                ),
                onPressed: () {
                  setState(() {
                    if (isPlayingAll) {
                      stopAudio();
                    } else {
                      isPlayingAll = true;
                      print(
                          'currentPlayingIndex == -1 ? 0 : currentPlayingIndex $currentPlayingIndex');
                      playAllAudio(
                          currentPlayingIndex == -1 ? 0 : currentPlayingIndex);
                    }
                  });
                },
              ),
              const Spacer(),
              Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.orange.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.hadayat,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontFamily: 'Noori',
                      ),
                    ),
                    Icon(Icons.roundabout_left_sharp),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    widget.screenPath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                    ),
                    itemCount: widget.gridItems.length,
                    itemBuilder: (context, index) {
                      final isAudioPlaying = index == currentPlayingIndex;
                      final itemColor =
                          isAudioPlaying ? Colors.orangeAccent : Colors.white;

                      return GestureDetector(
                        onTap: () {
                          if (isPlayingAll) {
                            print('Playing All pessed $index');
                            playAllAudio(index);
                          } else {
                            print('play once pressed $index');
                            playAudio(index);
                          }
                        },
                        child: LettersWidget(
                          svgImage: widget.gridItems[index]['imagePath']!,
                          color: itemColor,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
