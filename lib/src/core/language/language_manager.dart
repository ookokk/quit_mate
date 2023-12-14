import 'package:flutter/material.dart';

class LanguageManager {
  LanguageManager._init();

  static LanguageManager? _instance;

  static LanguageManager get instance {
    _instance ??= LanguageManager._init();
    return _instance!;
  }

  final Locale englishLocale = const Locale('en', 'US');
  final Locale turkishLocale = const Locale('tr', 'TR');
  Locale _currentLocale = const Locale('tr', 'TR');
  //ispanya çince mandarin chinese hindice

  List<Locale> get supportedLocales => [englishLocale, turkishLocale];

  Locale get currentLocale => _currentLocale;

  void setLocale(Locale newLocale) {
    if (supportedLocales.contains(newLocale)) {
      _currentLocale = newLocale;
    } else {
      _currentLocale = turkishLocale;
    }
  }
}
