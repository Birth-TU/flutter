import 'package:audioplayer/audioplayer.dart';
import 'dart:async';

class AudioService {
  static AudioPlayer player;
  static  bool isPlaying;

  static void init() {
    player = new AudioPlayer();
    isPlaying = false;
  }

  static Future<void> play() async {
    await player.play("https://birth-tu.firebaseapp.com/resources/misc/song.mp3");
    isPlaying = true;
  }

  static Future<void> pause() async {
    await player.pause();
    isPlaying = false;
  }

  static void toggle() {
    if ( isPlaying ) pause();
    else play();
  }

  static Future<void> stop() async {
    await player.stop();
  }
}