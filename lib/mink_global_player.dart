library mink_global_player;

import 'package:just_audio/just_audio.dart';
import 'package:mink_global_player/flow_player.dart';

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
