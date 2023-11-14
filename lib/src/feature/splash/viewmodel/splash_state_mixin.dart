import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quit_mate/src/feature/splash/view/splash_view.dart';

mixin SplashStateMixin on ConsumerState<SplashView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    checkUserAndNavigate();
  }

  void checkUserAndNavigate() {
    final User? currentUser = _auth.currentUser;
    Future.delayed(const Duration(seconds: 3), () {
      if (currentUser != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }
}
