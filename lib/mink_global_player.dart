library mink_global_player;

import 'package:just_audio/just_audio.dart';
import 'package:mink_global_player/flow_player.dart';

class MinkGlobalPlayer {
  static MinkGlobalPlayer instance = MinkGlobalPlayer();

  final FlowPlayer offVoice;
  final FlowPlayer music;
  final FlowPlayer effect;

  MinkGlobalPlayer({
    FlowPlayer? mockedOffVoicePlayer,
    FlowPlayer? mockedMusicPlayer,
    FlowPlayer? mockedEffectPlayer,
  })  : offVoice = mockedOffVoicePlayer ?? FlowPlayer(),
        music = mockedMusicPlayer ?? FlowPlayer(loopMode: LoopMode.all),
        effect = mockedEffectPlayer ?? FlowPlayer();

  Future<void> stop() async {
    await Future.wait([
      offVoice.stop(),
      music.stop(),
      effect.stop(),
    ]);
  }

  Future<void> pause() async {
    await Future.wait([
      offVoice.pause(),
      music.pause(),
      effect.pause(),
    ]);
  }

  Future<void> play() async {
    await Future.wait([
      offVoice.play(),
      music.play(),
      effect.play(),
    ]);
  }
}
