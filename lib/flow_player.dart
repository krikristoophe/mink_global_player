import 'package:just_audio/just_audio.dart';

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
    await _player.play();
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
