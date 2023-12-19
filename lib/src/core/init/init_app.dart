import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quit_mate/src/core/network/firebase_options.dart';

class InitApp {
  void initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await EasyLocalization.ensureInitialized();
    //await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    EasyLocalization.logger.enableBuildModes = [];
  }
}
