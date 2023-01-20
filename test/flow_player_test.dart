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

        const String asset = 'assets/audio.mp3';

        await flowPlayer.loadAsset(asset);
        verify(mockAudioPlayer.stop()).called(1);
        verify(mockAudioPlayer.setAsset(asset)).called(1);
      });
    });

    group('play', () {
      test('player not initialized don\'t call play', () async {
        const LoopMode loopMode = LoopMode.one;
        MockAudioPlayer mockAudioPlayer = MockAudioPlayer();
        final FlowPlayer flowPlayer = FlowPlayer(
          mockedAudioPlayer: mockAudioPlayer,
          loopMode: loopMode,
        );

        await flowPlayer.play();
        verify(mockAudioPlayer.setLoopMode(loopMode)).called(1);
        verify(mockAudioPlayer.setVolume(any)).called(1);
        verifyNever(mockAudioPlayer.play());
      });
    });

    group('restart', () {
      test('call stop before play', () async {
        MockAudioPlayer mockAudioPlayer = MockAudioPlayer();
        final FlowPlayer flowPlayer = FlowPlayer(
          mockedAudioPlayer: mockAudioPlayer,
        );

        await flowPlayer.restart();
        verify(mockAudioPlayer.seek(any)).called(1);
        verify(flowPlayer.stop()).called(1);
        verify(flowPlayer.play()).called(1);
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
