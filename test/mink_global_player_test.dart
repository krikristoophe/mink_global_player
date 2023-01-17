import 'package:flutter_test/flutter_test.dart';
import 'package:mink_global_player/flow_player.dart';
import 'package:mink_global_player/mink_global_player.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'mink_global_player_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FlowPlayer>()])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('MinkGlobalPlayer -', () {
    test('instance is available', () {
      expect(MinkGlobalPlayer.instance, isNotNull);
    });

    group('stop', () {
      test('call all player stop function', () async {
        final MockFlowPlayer offVoiceFlowPlayer = MockFlowPlayer();
        final MockFlowPlayer effectFlowPlayer = MockFlowPlayer();
        final MockFlowPlayer musicFlowPlayer = MockFlowPlayer();

        final MinkGlobalPlayer globalPlayer = MinkGlobalPlayer(
          mockedEffectPlayer: effectFlowPlayer,
          mockedMusicPlayer: musicFlowPlayer,
          mockedOffVoicePlayer: offVoiceFlowPlayer,
        );

        await globalPlayer.stop();
        verify(offVoiceFlowPlayer.stop()).called(1);
        verify(effectFlowPlayer.stop()).called(1);
        verify(musicFlowPlayer.stop()).called(1);
      });
    });

    group('play', () {
      test('call all player play function', () async {
        final MockFlowPlayer offVoiceFlowPlayer = MockFlowPlayer();
        final MockFlowPlayer effectFlowPlayer = MockFlowPlayer();
        final MockFlowPlayer musicFlowPlayer = MockFlowPlayer();

        final MinkGlobalPlayer globalPlayer = MinkGlobalPlayer(
          mockedEffectPlayer: effectFlowPlayer,
          mockedMusicPlayer: musicFlowPlayer,
          mockedOffVoicePlayer: offVoiceFlowPlayer,
        );

        await globalPlayer.play();
        verify(offVoiceFlowPlayer.play()).called(1);
        verify(effectFlowPlayer.play()).called(1);
        verify(musicFlowPlayer.play()).called(1);
      });
    });

    group('pause', () {
      test('call all player pause function', () async {
        final MockFlowPlayer offVoiceFlowPlayer = MockFlowPlayer();
        final MockFlowPlayer effectFlowPlayer = MockFlowPlayer();
        final MockFlowPlayer musicFlowPlayer = MockFlowPlayer();

        final MinkGlobalPlayer globalPlayer = MinkGlobalPlayer(
          mockedEffectPlayer: effectFlowPlayer,
          mockedMusicPlayer: musicFlowPlayer,
          mockedOffVoicePlayer: offVoiceFlowPlayer,
        );

        await globalPlayer.pause();
        verify(offVoiceFlowPlayer.pause()).called(1);
        verify(effectFlowPlayer.pause()).called(1);
        verify(musicFlowPlayer.pause()).called(1);
      });
    });
  });
}
