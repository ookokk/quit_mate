import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quit_mate/src/feature/splash/splash/view/splash_view.dart';
import 'package:quit_mate/src/product/user/repository/user_repository.dart';

mixin SplashStateMixin on ConsumerState<SplashView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserRepository userRepository = UserRepository();
  @override
  void initState() {
    super.initState();
    checkUserAndNavigate();
  }

  void checkUserAndNavigate() async {
    final User? currentUser = _auth.currentUser;

    Future.delayed(const Duration(seconds: 0), () {
      if (currentUser == null) {
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        Navigator.pushReplacementNamed(context, '/navigation');
      }
    });
  }
}
