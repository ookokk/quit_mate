import 'package:flutter/material.dart';
import 'package:quit_mate/src/feature/affirmation/view/affirmation_view.dart';
import 'package:quit_mate/src/feature/auth/login/view/login_view.dart';
import 'package:quit_mate/src/feature/auth/register/view/register_view.dart';
import 'package:quit_mate/src/feature/get_started/view/get_started_view.dart';
import 'package:quit_mate/src/feature/set_bg_image/view/set_bg_image_view.dart';
import 'package:quit_mate/src/feature/splash/view/splash_view.dart';

final class Routes {
  //BASE
  static const String splash = '/splash';
  static const String getStarted = '/getStarted';
  //AUTH
  static const String login = '/login';
  static const String register = '/register';
  //GET USER INFORMATION
  static const String addictive = '/addictive';
  //HOME
  static const String home = '/home';
  static const String setBG = '/setBG';
  static const String affirmation = '/affirmation';

  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashView(),
    getStarted: (context) => const GetStartedView(),
    login: (context) => LoginView(),
    register: (context) => RegisterView(),
    setBG: (context) => SetBGImageView(),
    affirmation: (context) => const AffirmationView(),
  };
}
