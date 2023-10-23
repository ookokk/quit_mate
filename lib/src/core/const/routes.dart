import 'package:flutter/material.dart';

class Routes {
  //BASE
  static const String splash = '/splash';
  static const String getStarted = '/getStarted';

  //HOME
  static const String home = '/home';
  static const String searchView = '/search';
  static const String helloUser = '/helloUser';
  static const String profile = '/profile';
  static const String profileSettings = '/profileSettings';
  static const String recentlyAddedJobs = '/recently';

  static final Map<String, WidgetBuilder> routes = {
    //splash: (context) => const SplashView(),
  };
}
