import 'package:flutter/material.dart';

enum Locales {
  en(Locale('en', 'US')),
  ar(Locale('ar', 'SA')),
  de(Locale('de', 'DE')),
  es(Locale('es', 'ES')),
  fr(Locale('fr', 'FR')),
  ja(Locale('ja', 'JP')),
  ru(Locale('ru', 'RU')),
  tr(Locale('tr', 'TR')),
  zh(Locale('zh', 'CN'));

  final Locale locale;

  const Locales(this.locale);
}
