import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:just_audio/just_audio.dart';
import 'package:manzil_offline/custom_widgets/audio_controller.dart';
import 'package:manzil_offline/custom_widgets/letters_widget.dart';
import 'package:manzil_offline/custom_widgets/takhti_image.dart';

class CustomScreen extends StatefulWidget {
  final String title;
  final List<Map<String, String>> hadayat;
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
      print(
          'stopAudio setState  currentPlayingIndex = -1 $currentPlayingIndex');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  'assets/images/custom_quran.png', // Replace with your image path
                  fit: BoxFit.cover, // Ensures the image covers the screen
                ),
              ),
            ),

            Column(
              children: [
                TakhtiImage(text: widget.title),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          color: Colors.white,
                          isPlayingAll ? Icons.pause : Icons.play_arrow,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            if (isPlayingAll) {
                              stopAudio();
                            } else {
                              isPlayingAll = true;
                              playAllAudio(currentPlayingIndex == -1
                                  ? 0
                                  : currentPlayingIndex);
                            }
                          });
                        },
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.white.withOpacity(0.9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'ہدایات برائے تختی',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'Noori',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      widget.hadayat.isNotEmpty
                                          ? widget.hadayat[0]
                                                  ["hadayatScreen"] ??
                                              'No Data'
                                          : 'No Hidayat Available',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              'ہدایات',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                fontFamily: 'Noori',
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.info_outline, color: Colors.white),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Expanded GridView that will take up the remaining space
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: AnimationLimiter(
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1,
                        ),
                        itemCount: widget.gridItems.length,
                        itemBuilder: (context, index) {
                          final isAudioPlaying = index == currentPlayingIndex;
                          final itemColor = isAudioPlaying
                              ? Colors.green.shade100
                              : const Color.fromARGB(255, 255, 255, 255);

                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            columnCount: widget.gridItems.length,
                            duration: const Duration(milliseconds: 375),
                            child: ScaleAnimation(
                              child: FadeInAnimation(
                                child: GestureDetector(
                                  onTap: () {
                                    if (isPlayingAll) {
                                      playAllAudio(index);
                                    } else {
                                      playAudio(index);
                                    }
                                  },
                                  child: LettersWidget(
                                    svgImage: widget.gridItems[index]
                                        ['imagePath']!,
                                    color: itemColor,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}