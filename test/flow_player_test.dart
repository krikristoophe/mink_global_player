import 'package:cross_file/cross_file.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mink_global_player/flow_player.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'flow_player_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AudioPlayer>()])
void main() {
  group('FlowPlayer -', () {
    group('loadUrl', () {
      test('stop and call player setUrl', () async {
        MockAudioPlayer mockAudioPlayer = MockAudioPlayer();
        final FlowPlayer flowPlayer = FlowPlayer(
          mockedAudioPlayer: mockAudioPlayer,
        );

        await flowPlayer.loadUrl('<a random file url>');
        verify(mockAudioPlayer.stop()).called(1);
        verify(mockAudioPlayer.setUrl(any)).called(1);
      });
    });

    group('loadFile', () {
      test('stop and call player setFilePath', () async {
        MockAudioPlayer mockAudioPlayer = MockAudioPlayer();
        final FlowPlayer flowPlayer = FlowPlayer(
          mockedAudioPlayer: mockAudioPlayer,
        );

        final XFile file = XFile('/path/for/test/audio.mp3');

        await flowPlayer.loadFile(file);
        verify(mockAudioPlayer.stop()).called(1);
        verify(mockAudioPlayer.setFilePath(file.path)).called(1);
      });
    });

    group('play', () {
      test('set loopMode and volume before calling player play', () async {
        const LoopMode loopMode = LoopMode.one;
        MockAudioPlayer mockAudioPlayer = MockAudioPlayer();
        final FlowPlayer flowPlayer = FlowPlayer(
          mockedAudioPlayer: mockAudioPlayer,
          loopMode: loopMode,
        );

        await flowPlayer.play();
        verify(mockAudioPlayer.setLoopMode(loopMode)).called(1);
        verify(mockAudioPlayer.setVolume(any)).called(1);
        verify(mockAudioPlayer.play()).called(1);
      });
    });

    group('stop', () {
      test('call player stop', () async {
        MockAudioPlayer mockAudioPlayer = MockAudioPlayer();
        final FlowPlayer flowPlayer = FlowPlayer(
          mockedAudioPlayer: mockAudioPlayer,
        );

        await flowPlayer.stop();
        verify(mockAudioPlayer.stop()).called(1);
      });
    });

    group('pause', () {
      test('call player pause', () async {
        MockAudioPlayer mockAudioPlayer = MockAudioPlayer();
        final FlowPlayer flowPlayer = FlowPlayer(
          mockedAudioPlayer: mockAudioPlayer,
        );

        await flowPlayer.pause();
        verify(mockAudioPlayer.pause()).called(1);
      });
    });

    group('setVolume', () {
      test('call player setVolume', () async {
        MockAudioPlayer mockAudioPlayer = MockAudioPlayer();
        final FlowPlayer flowPlayer = FlowPlayer(
          mockedAudioPlayer: mockAudioPlayer,
          volume: 0.7,
        );

        expect(flowPlayer.volume, 0.7);

        await flowPlayer.setVolume(0.6);
        expect(flowPlayer.volume, 0.6);
      });
    });
  });
}
