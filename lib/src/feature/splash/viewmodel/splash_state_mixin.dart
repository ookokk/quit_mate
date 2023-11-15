import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quit_mate/src/core/cache/cache_manager/cache_manager.dart';
import 'package:quit_mate/src/feature/splash/view/splash_view.dart';

mixin SplashStateMixin on ConsumerState<SplashView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    checkUserAndNavigate();
  }

  void checkUserAndNavigate() async {
    final User? currentUser = _auth.currentUser;
    final bool isFirstTime = await CacheManager.getBool('isFirst') ?? true;

    Future.delayed(const Duration(seconds: 3), () {
      if (isFirstTime) {
        Navigator.pushReplacementNamed(context, '/getStarted');
      } else if (currentUser == null) {
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }
}
