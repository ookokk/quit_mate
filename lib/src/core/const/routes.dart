import 'package:flutter/material.dart';
import 'package:quit_mate/src/feature/affirmation/view/affirmation_view.dart';
import 'package:quit_mate/src/feature/auth/login/view/login_view.dart';
import 'package:quit_mate/src/feature/auth/register/view/register_view.dart';
import 'package:quit_mate/src/feature/get_started/view/get_started_view.dart';
import 'package:quit_mate/src/feature/get_user_information/view/get_user_information_view.dart';
import 'package:quit_mate/src/feature/home/view/home_view.dart';
import 'package:quit_mate/src/feature/set_bg_image/view/set_bg_image_view.dart';
import 'package:quit_mate/src/feature/settings/feature/privacy/view/privacy_view.dart';
import 'package:quit_mate/src/feature/settings/view/settings_view.dart';
import 'package:quit_mate/src/feature/splash/view/splash_view.dart';

class Routes {
  //BASE
  static const String splash = '/splash';
  static const String getStarted = '/getStarted';
  static const String getUserInfo = '/getUserInfo';
  //AUTH
  static const String login = '/login';
  static const String register = '/register';

  //HOME
  static const String home = '/home';
  static const String setBG = '/setBG';
  static const String affirmation = '/affirmation';
  static const String settings = '/settings';
  //settings
  static const String privacy = '/privacy';

  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashView(),
    home: (context) => const HomeView(),
    getStarted: (context) => const GetStartedView(),
    login: (context) => LoginView(),
    register: (context) => RegisterView(),
    setBG: (context) => SetBGImageView(),
    affirmation: (context) => const AffirmationView(),
    settings: (context) => const SettingsView(),
    privacy: (context) => const PrivacyView(),
    getUserInfo: (context) => GetUserInformationView(),
  };
}
