import 'package:exemple/widgets/slider_with_title.dart';
import 'package:flutter/material.dart';
import 'package:mink_global_player/mink_global_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mink Global Player Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double volumeEffect = 1;
  double volumeMusic = 1;
  double volumeOffVoice = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mink Global Player Exemple'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () async {
                        await MinkGlobalPlayer.instance.offVoice.loadUrl(
                          'https://www.kozco.com/tech/LRMonoPhase4.mp3',
                        );
                        await MinkGlobalPlayer.instance.music.loadUrl(
                          'https://www.kozco.com/tech/piano2-CoolEdit.mp3',
                        );
                        await MinkGlobalPlayer.instance.effect.loadUrl(
                          'https://www.fesliyanstudios.com/play-mp3/387',
                        );
                      },
                      child: const Text('Load from url'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await MinkGlobalPlayer.instance.offVoice.loadAsset(
                          'assets/voice.mp3',
                        );
                        await MinkGlobalPlayer.instance.effect.loadAsset(
                          'assets/effect.mp3',
                        );
                        await MinkGlobalPlayer.instance.music.loadAsset(
                          'assets/music.mp3',
                        );
                      },
                      child: const Text('Load from assets'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await MinkGlobalPlayer.instance.play();
                      },
                      child: const Text('Play'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await MinkGlobalPlayer.instance.playOnlyMusicAndVoice();
                      },
                      child: const Text('Play only music and voice'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await MinkGlobalPlayer.instance.effect.restart();
                      },
                      child: const Text('Play only effect'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await MinkGlobalPlayer.instance.pause();
                      },
                      child: const Text('Pause'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await MinkGlobalPlayer.instance.stop();
                      },
                      child: const Text('Stop'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SliderWithTitle(
                      value: volumeEffect,
                      onChanged: (double volume) async {
                        setState(() {
                          volumeEffect = volume;
                        });
                        await MinkGlobalPlayer.instance.effect.setVolume(
                          volume,
                        );
                      },
                      title: 'Volume effects',
                    ),
                    SliderWithTitle(
                      value: volumeMusic,
                      onChanged: (double volume) async {
                        setState(() {
                          volumeMusic = volume;
                        });
                        await MinkGlobalPlayer.instance.music.setVolume(
                          volume,
                        );
                      },
                      title: 'Volume music',
                    ),
                    SliderWithTitle(
                      value: volumeOffVoice,
                      onChanged: (double volume) async {
                        setState(() {
                          volumeOffVoice = volume;
                        });
                        await MinkGlobalPlayer.instance.offVoice.setVolume(
                          volume,
                        );
                      },
                      title: 'Volume off voice',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
