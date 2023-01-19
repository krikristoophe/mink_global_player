# Mink Global Player

Manage the three flows needed for mink's app :
- Music
- Effects
- Off voice

### Exemple

Exemple of use can be found in `exemple/lib/main.dart` app

## Integration with FlutterFlow

### Troubleshooting

FlutterFlow have error when system run `flutter pub get` with `mink_global_player` dependency. It also give no more error so it's impossible to debug the error to fix it.

The alternative found is to add the mink_global_player code directly in FlutterFlow. The only method to achieve this is to create a custom widget that will no be used as widget. It's the only way to make available the custom type `MinkGlobalPlayer` everywhere.

### Custom Widget

To make `MinkGlobalPlayer` available everywhere in app you have to create a custom widget in FlutterFlow. Name the widget `MinkGlobalPlayerWidget` and add the dependency `just_audio` in the right pannel of interface.

From there you can copy/paste the content of `flutter_flow/mink_global_player_widget.dart` in the FlutterFlow interface.

At this time you should not have an error. You can build the app without problem (but it not ended).

### Custom actions

To call the global player from button in FlutterFlow you hae to create a custom action for every needed feature.

If you have to create a new action, an action template is available in `flutter_flow/action_exemple.dart`.

#### Volumes

Volumes can be set by calling theses actions. They take a double type in argument. This double have a value between 0 and 1.

##### Music

Create a custom action in FlutterFlow named `setMusicVolume`. Add argument in the right pannel named `volume` of type `Double` and not nullable. Copy/paste the content of `flutter_flow/set_music_volume_action.dart`.

##### Effect

Create a custom action in FlutterFlow named `setEffectVolume`. Add argument in the right pannel named `volume` of type `Double` and not nullable. Copy/paste the content of `flutter_flow/set_effect_volume_action.dart`.

##### Voice

Create a custom action in FlutterFlow named `setVoiceVolume`. Add argument in the right pannel named `volume` of type `Double` and not nullable. Copy/paste the content of `flutter_flow/set_voice_volume_action.dart`.


#### Run from asset

These actions load an asset Audio file and play it from the beggining. The music flow is the only one that play in loop and only stop if you call the `pause` action.

##### Music

Create a custom action in FlutterFlow named `runMusic`. Add argument in the right pannel named `asset` of type `AudioPath` and not nullable. Copy/paste the content of `flutter_flow/run_music_action.dart`.

##### Effect

Create a custom action in FlutterFlow named `runEffect`. Add argument in the right pannel named `asset` of type `AudioPath` and not nullable. Copy/paste the content of `flutter_flow/run_effect_action.dart`.

##### Voice

Create a custom action in FlutterFlow named `runVoice`. Add argument in the right pannel named `asset` of type `AudioPath` and not nullable. Copy/paste the content of `flutter_flow/run_voice_action.dart`.


#### Run from url

These actions load an Audio file from url and play it from the beggining. The music flow is the only one that play in loop and only stop if you call the `pause` action.

##### Music

Create a custom action in FlutterFlow named `runMusicFromUrl`. Add argument in the right pannel named `url` of type `String` and not nullable. Copy/paste the content of `flutter_flow/run_music_from_url_action.dart`.

##### Effect

Create a custom action in FlutterFlow named `runEffectFromUrl`. Add argument in the right pannel named `url` of type `String` and not nullable. Copy/paste the content of `flutter_flow/run_effect_from_url_action.dart`.

##### Voice

Create a custom action in FlutterFlow named `runVoiceFromUrl`. Add argument in the right pannel named `url` of type `String` and not nullable. Copy/paste the content of `flutter_flow/run_voice_from_url_action.dart`.


#### Other basic commands

##### Pause

This action pause all running flows.

Create a custom action in FlutterFlow named `pause`. Copy paste the content of `flutter_flow/pause_action.dart`. No more configuration needed.

##### Play

This action play all flows with the previous loaded content. (useful when user want to resume after pause)

Create a custom action in FlutterFlow named `play`. Copy paste the content of `flutter_flow/play_action.dart`. No more configuration needed.


## Developpement

Before all command, get all dependencies by running :

```sh
flutter pub get
```

To run test, build mocks by running build_runner before testing :

```sh
flutter pub run build_runner build --delete-conflicting-outputs
flutter test --coverage
```

To run analysis :

```sh
flutter analyze
```

To run auto formatting :

```sh
flutter format --fix
```