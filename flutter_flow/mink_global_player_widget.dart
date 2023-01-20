// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import '../widgets/index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:just_audio/just_audio.dart';

/// This widget is used to serve global player instance
/// It can't be used as a widget but it is the only method found to
/// serve a custom type like [MinkGlobalPlayer]
/// Don't forget to add `just_audio` dependency in the bottom of right
/// pannel in this widget flutterflow interface
class MinkGlobalPlayerWidget extends StatefulWidget {
  static MinkGlobalPlayer get globalPlayer => MinkGlobalPlayer.instance;
  const MinkGlobalPlayerWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _MinkGlobalPlayerWidgetState createState() => _MinkGlobalPlayerWidgetState();
}

class _MinkGlobalPlayerWidgetState extends State<MinkGlobalPlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

/// Manage behaviour of audio player
class FlowPlayer {
  final AudioPlayer _player;

  /// AudioPlayer loopMode
  /// Useful for make music loop infinite
  final LoopMode loopMode;

  /// Volume used for current player
  /// Updated at every [play] call
  double volume;

  /// [mockedAudioPlayer] is audioPlayer used
  /// Useful for testing
  FlowPlayer({
    AudioPlayer? mockedAudioPlayer,
    this.loopMode = LoopMode.off, // Default no loop
    this.volume = 1,
  }) : _player = mockedAudioPlayer ?? AudioPlayer();

  /// Load audio from [url] (network)
  /// Stop current playing audio if any
  Future<void> loadUrl(String url) async {
    await stop();
    await _player.setUrl(url);
  }

  /// Load audio from app assets
  /// [asset] need to have full assets path
  ///
  /// ```dart
  /// loadAssets('assets/voice.mp3')
  /// ```
  Future<void> loadAsset(String asset) async {
    await stop();
    await _player.setAsset(asset);
  }

  /// Play current loaded audio
  /// Update configuration (volume and loopMode)
  Future<void> play() async {
    await _player.setLoopMode(loopMode);
    await _player.setVolume(volume);
    if (_player.audioSource != null) {
      await _player.play();
    }
  }

  /// Restart current loaded audio
  /// Useful for effect like click sound that have to be played multiple time
  Future<void> restart() async {
    await stop();
    await _player.seek(Duration.zero);
    await play();
  }

  /// Stop current audio played
  Future<void> stop() async {
    await _player.stop();
  }

  /// Pause current audio played
  Future<void> pause() async {
    await _player.pause();
  }

  /// Set volume of current flow
  /// Only updated when calling [play] method
  Future<void> setVolume(double volume) async {
    this.volume = volume;
  }
}

/// Manage the three audio flows
class MinkGlobalPlayer {
  /// Instance is used to keep same audio players for whole app
  static MinkGlobalPlayer instance = MinkGlobalPlayer();

  /// Off voice flow
  final FlowPlayer offVoice;

  /// Music flow, loop by default
  final FlowPlayer music;

  /// Effects flow
  final FlowPlayer effect;

  /// [mockedOffVoicePlayer], [mockedMusicPlayer] and [mockedEffectPlayer] are
  /// only needed for testing
  MinkGlobalPlayer({
    FlowPlayer? mockedOffVoicePlayer,
    FlowPlayer? mockedMusicPlayer,
    FlowPlayer? mockedEffectPlayer,
  })  : offVoice = mockedOffVoicePlayer ?? FlowPlayer(),
        music = mockedMusicPlayer ??
            FlowPlayer(loopMode: LoopMode.all), // default loop
        effect = mockedEffectPlayer ?? FlowPlayer();

  /// Stop all flows players
  Future<void> stop() async {
    await Future.wait([
      offVoice.stop(),
      music.stop(),
      effect.stop(),
    ]);
  }

  /// Pause all flows players
  Future<void> pause() async {
    await Future.wait([
      offVoice.pause(),
      music.pause(),
      effect.pause(),
    ]);
  }

  /// Play all flow players
  Future<void> play() async {
    await Future.wait([
      offVoice.play(),
      music.play(),
      effect.play(),
    ]);
  }

  /// Play only music and off voice player
  Future<void> playOnlyMusicAndVoice() async {
    await Future.wait([
      offVoice.play(),
      music.play(),
    ]);
  }
}
