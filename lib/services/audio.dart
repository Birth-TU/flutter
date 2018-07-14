import 'package:audioplayer/audioplayer.dart';
import 'dart:async';

class AudioService {
  static AudioPlayer player;

  static void init() {
    player = new AudioPlayer();
  }

  static Future<void> play() async {
    await player.play("https://birth-tu.firebaseapp.com/resources/misc/song.mp3");
  }

  static Future<void> stop() async {
    await player.stop();
  }
}