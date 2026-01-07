// Flutter web plugin registrant file.
//
// Generated file. Do not edit.
//

// @dart = 2.13
// ignore_for_file: type=lint

import 'package:agora_rtc_engine/agora_rtc_engine_web.dart';
import 'package:audio_session/audio_session_web.dart';
import 'package:camera_web/camera_web.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter_web.dart';
import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:firebase_messaging_web/firebase_messaging_web.dart';
import 'package:flutter_sound_web/flutter_sound_web.dart';
import 'package:fluttertoast/fluttertoast_web.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';
import 'package:image_cropper_for_web/image_cropper_for_web.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:iris_method_channel/iris_method_channel_web.dart';
import 'package:just_audio_web/just_audio_web.dart';
import 'package:package_info_plus/src/package_info_plus_web.dart';
import 'package:permission_handler_html/permission_handler_html.dart';
import 'package:record_web/record_web.dart';
import 'package:rive_common/rive_web.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';
import 'package:video_player_web/video_player_web.dart';
import 'package:wakelock_plus/src/wakelock_plus_web_plugin.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins([final Registrar? pluginRegistrar]) {
  final Registrar registrar = pluginRegistrar ?? webPluginRegistrar;
  AgoraRtcEngineWeb.registerWith(registrar);
  AudioSessionWeb.registerWith(registrar);
  CameraPlugin.registerWith(registrar);
  EmojiPickerFlutterPluginWeb.registerWith(registrar);
  FirebaseAuthWeb.registerWith(registrar);
  FirebaseCoreWeb.registerWith(registrar);
  FirebaseMessagingWeb.registerWith(registrar);
  FlutterSoundPlugin.registerWith(registrar);
  FluttertoastWebPlugin.registerWith(registrar);
  GoogleSignInPlugin.registerWith(registrar);
  ImageCropperPlugin.registerWith(registrar);
  ImagePickerPlugin.registerWith(registrar);
  IrisMethodChannelWeb.registerWith(registrar);
  JustAudioPlugin.registerWith(registrar);
  PackageInfoPlusWebPlugin.registerWith(registrar);
  WebPermissionHandler.registerWith(registrar);
  RecordPluginWeb.registerWith(registrar);
  RivePlugin.registerWith(registrar);
  SharedPreferencesPlugin.registerWith(registrar);
  VideoPlayerPlugin.registerWith(registrar);
  WakelockPlusWebPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
