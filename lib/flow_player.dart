import 'package:cross_file/cross_file.dart';
import 'package:just_audio/just_audio.dart';

class FlowPlayer {
  final AudioPlayer _player;
  final LoopMode loopMode;
  double volume;

  FlowPlayer({
    AudioPlayer? mockedAudioPlayer,
    this.loopMode = LoopMode.off,
    this.volume = 1,
  }) : _player = mockedAudioPlayer ?? AudioPlayer();

  Future<void> loadUrl(String url) async {
    await stop();
    await _player.setUrl(url);
  }

  Future<void> loadFile(XFile file) async {
    await stop();

    await _player.setFilePath(file.path);
  }

  Future<void> play() async {
    await _player.setLoopMode(loopMode);
    await _player.setVolume(volume);
    await _player.play();
  }

  Future<void> stop() async {
    await _player.stop();
  }

  Future<void> pause() async {
    await _player.pause();
  }

  Future<void> setVolume(double volume) async {
    this.volume = volume;
  }
}
