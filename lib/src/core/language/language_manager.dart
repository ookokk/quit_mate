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
  final Locale nederlandLocale = const Locale('nl', 'NL');
  Locale _currentLocale = const Locale('tr', 'TR');

  List<Locale> get supportedLocales =>
      [englishLocale, turkishLocale, nederlandLocale];

  Locale get currentLocale => _currentLocale;

  void setLocale(Locale newLocale) {
    if (supportedLocales.contains(newLocale)) {
      _currentLocale = newLocale;
    } else {
      _currentLocale = turkishLocale;
    }
  }
}
