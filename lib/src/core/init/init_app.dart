import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quit_mate/src/core/network/firebase_options.dart';

class InitApp {
  void initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    MobileAds.instance.initialize();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}
