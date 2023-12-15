import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:quit_mate/src/core/cache/cache_manager/cache_manager.dart';
import 'package:quit_mate/src/core/language/enums/locales.dart';

class LanguageManager {
  LanguageManager._init();

  static LanguageManager? _instance;

  static LanguageManager get instance {
    _instance ??= LanguageManager._init();
    return _instance!;
  }

  Locale _currentLocale = const Locale('en', 'US');
  List<Locale> get supportedLocales => [
        Locales.en.locale,
        Locales.ar.locale,
        Locales.de.locale,
        Locales.es.locale,
        Locales.fr.locale,
        Locales.ja.locale,
        Locales.ru.locale,
        Locales.tr.locale,
        Locales.zh.locale,
      ];

  Locale get currentLocale => _currentLocale;

  Future<void> updateLanguage(BuildContext context, Locales value) async {
    await context.setLocale(value.locale);
    _currentLocale = value.locale;
    CacheManager.setString('language', 'tr');
  }
}
