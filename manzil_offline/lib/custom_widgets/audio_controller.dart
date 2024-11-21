import 'package:flutter/material.dart';

class AudioController extends ChangeNotifier {
  bool _isAudioEnabled = true;

  bool get isAudioEnabled => _isAudioEnabled;

  void setAudioEnabled(bool value) {
    _isAudioEnabled = value;
    notifyListeners(); // Notify listeners of the state change
  }
}
