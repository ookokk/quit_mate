import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:quit_mate/src/core/cache/cache_manager/cache_manager.dart';
import 'package:quit_mate/src/feature/splash/splash/view/splash_view.dart';
import 'package:quit_mate/src/product/user/model/sober_user.dart';
import 'package:quit_mate/src/product/user/repository/user_repository.dart';

mixin SplashStateMixin on ConsumerState<SplashView> {
  final UserRepository userRepository = UserRepository();
  final SoberUser soberUser = SoberUser();
  @override
  void initState() {
    super.initState();
    checkUserAndNavigate();
  }

  void checkUserAndNavigate() async {
    final bool isFirst = await CacheManager.getBool('isFirst');

    Future.delayed(const Duration(seconds: 0), () {
      if (isFirst) {
        Navigator.pushReplacementNamed(context, '/getStarted');
      } else {
        Navigator.pushReplacementNamed(context, '/navigation');
      }
    });
  }
}
