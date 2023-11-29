import 'package:flutter/material.dart';
import 'package:quit_mate/src/feature/navigation/features/affirmation/view/affirmation_view.dart';
import 'package:quit_mate/src/feature/navigation/features/set_bg_image/view/set_bg_image_view.dart';
import 'package:quit_mate/src/feature/navigation/view/navigation_view.dart';
import 'package:quit_mate/src/feature/notification/view/edit_notifications_view.dart';
import 'package:quit_mate/src/feature/settings/feature/privacy/view/privacy_view.dart';
import 'package:quit_mate/src/feature/settings/view/settings_view.dart';
import 'package:quit_mate/src/feature/splash/get_started/view/get_started_view.dart';
import 'package:quit_mate/src/feature/splash/get_user_information/view/get_user_information_view.dart';
import 'package:quit_mate/src/feature/splash/splash/view/splash_view.dart';

class Routes {
  //BASE
  static const String splash = '/splash';
  static const String getStarted = '/getStarted';
  static const String getUserInfo = '/getUserInfo';
  //AUTH
  static const String login = '/login';
  static const String register = '/register';
  //HOME
  static const String navigation = '/navigation';
  static const String setBG = '/setBG';
  static const String affirmation = '/affirmation';
  static const String settings = '/settings';
  //settings
  static const String privacy = '/privacy';
  static const String editNtf = '/editNotification';

  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashView(),
    navigation: (context) => const NavigationView(),
    getStarted: (context) => const GetStartedView(),
    setBG: (context) => SetBGImageView(),
    affirmation: (context) => const AffirmationView(),
    settings: (context) => const SettingsView(),
    privacy: (context) => const PrivacyView(),
    getUserInfo: (context) => GetUserInformationView(),
    editNtf: (context) => const EditNotificationsView(),
  };
}
