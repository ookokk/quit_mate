import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final languageManagerProvider = Provider<LanguageManager>((ref) {
  return LanguageManager.instance;
});

class LanguageManager {
  LanguageManager._init();

  static LanguageManager? _instance;

  static LanguageManager get instance {
    _instance ??= LanguageManager._init();
    return _instance!;
  }

  final Locale englishLocale = const Locale('en', 'US');
  final Locale arabicLocale = const Locale('ar', 'SA');
  final Locale germanLocale = const Locale('de', 'DE');
  final Locale spainLocale = const Locale('es', 'ES');
  final Locale frenchLocale = const Locale('fr', 'FR');
  final Locale japaneseLocale = const Locale('ja', 'JP');
  final Locale russianLocale = const Locale('ru', 'RU');
  final Locale turkishLocale = const Locale('tr', 'TR');
  final Locale chineseLocale = const Locale('zh', 'CN');

  final Locale _currentLocale = const Locale('en', 'US');

  List<Locale> get supportedLocales => [
        englishLocale,
        arabicLocale,
        germanLocale,
        spainLocale,
        frenchLocale,
        japaneseLocale,
        russianLocale,
        turkishLocale,
        chineseLocale
      ];

  Locale get currentLocale => _currentLocale;
}
