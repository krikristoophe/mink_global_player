// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import '../actions/index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../widgets/index.dart';

Future runVoiceFromUrl(String url) async {
  await MinkGlobalPlayerWidget.globalPlayer.offVoice.loadUrl(url);
  await MinkGlobalPlayerWidget.globalPlayer.offVoice.restart();
}
