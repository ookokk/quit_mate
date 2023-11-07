import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quit_mate/src/core/network/firebase_options.dart';

final class InitApp {
  void initApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    WidgetsFlutterBinding.ensureInitialized();
  }
}
