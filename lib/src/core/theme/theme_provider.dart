import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/cache/cache_manager/cache_manager.dart';

import 'custom_text_theme.dart';

final themeProvider =
    StateNotifierProvider.autoDispose<ThemeProvider, ThemeData>((ref) {
  return ThemeProvider();
});

class ThemeProvider extends StateNotifier<ThemeData> {
  ThemeProvider() : super(lightTheme) {
    _loadTheme();
  }
  ThemeData currentTheme = lightTheme;

  Future<void> _loadTheme() async {
    final String? themeName = await CacheManager.getString('theme');
    if (themeName == "darkTheme") {
      state = ThemeProvider.darkTheme;
      currentTheme = ThemeProvider.darkTheme;
    } else {
      state = ThemeProvider.lightTheme;
      currentTheme = ThemeProvider.lightTheme;
    }
  }

  void toggleTheme() async {
    if (state == ThemeProvider.lightTheme) {
      state = ThemeProvider.darkTheme;
      await CacheManager.setString("theme", "darkTheme");
    } else {
      state = ThemeProvider.lightTheme;
      await CacheManager.setString("theme", "lightTheme");
    }
  }

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    indicatorColor: Colors.black,
    brightness: Brightness.light,
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: Colors.white,
    ),
    hoverColor: const Color(0xff5d7cbd),
    cardColor: const Color(0xff5dad67),
    shadowColor: const Color(0xffcfdcec),
    splashColor: const Color(0xffF39F5A),
    dialogBackgroundColor: const Color(0xffe8576a),
    canvasColor: const Color(0xffd0fd00),
    primaryColor: const Color(0xff2371b0),
    disabledColor: const Color(0xff0c3e88),
    textTheme: TextTheme(
      displayLarge:
          CustomTextTheme.instance!.headline57.copyWith(color: Colors.black),
      displayMedium:
          CustomTextTheme.instance!.headline45.copyWith(color: Colors.black),
      displaySmall:
          CustomTextTheme.instance!.headline36.copyWith(color: Colors.black),
      headlineLarge:
          CustomTextTheme.instance!.headline32.copyWith(color: Colors.black),
      headlineMedium:
          CustomTextTheme.instance!.headline28.copyWith(color: Colors.black),
      headlineSmall:
          CustomTextTheme.instance!.headline24.copyWith(color: Colors.black),
      titleLarge:
          CustomTextTheme.instance!.headline22.copyWith(color: Colors.black),
      titleMedium:
          CustomTextTheme.instance!.headline16.copyWith(color: Colors.black),
      titleSmall:
          CustomTextTheme.instance!.headline14.copyWith(color: Colors.black),
      labelLarge:
          CustomTextTheme.instance!.headline14l.copyWith(color: Colors.black),
      labelMedium:
          CustomTextTheme.instance!.headline12l.copyWith(color: Colors.black),
      labelSmall:
          CustomTextTheme.instance!.headline11l.copyWith(color: Colors.black),
      bodyLarge:
          CustomTextTheme.instance!.headline16b.copyWith(color: Colors.black),
      bodyMedium:
          CustomTextTheme.instance!.headline14b.copyWith(color: Colors.black),
      bodySmall:
          CustomTextTheme.instance!.headline12b.copyWith(color: Colors.black),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xff73a9e6)),
  );

  static final ThemeData darkTheme = ThemeData(
    indicatorColor: Colors.white,
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: Color(0xff3e484d),
    ),
    hoverColor: const Color(0xff5d7cbd),
    scaffoldBackgroundColor: Colors.black26,
    disabledColor: const Color(0xff0c3e88),
    cardColor: const Color(0xff5dad67),
    shadowColor: const Color(0xff343942),
    primaryColor: const Color(0xff5d5d5d),
    splashColor: const Color(0xff204354),
    canvasColor: const Color(0xffd0fd00),
    dialogBackgroundColor: const Color(0xff557ec2),
    brightness: Brightness.dark,
    textTheme: TextTheme(
      displayLarge:
          CustomTextTheme.instance!.headline57.copyWith(color: Colors.white),
      displayMedium:
          CustomTextTheme.instance!.headline45.copyWith(color: Colors.white),
      displaySmall:
          CustomTextTheme.instance!.headline36.copyWith(color: Colors.white),
      headlineLarge:
          CustomTextTheme.instance!.headline32.copyWith(color: Colors.white),
      headlineMedium:
          CustomTextTheme.instance!.headline28.copyWith(color: Colors.white),
      headlineSmall:
          CustomTextTheme.instance!.headline24.copyWith(color: Colors.white),
      titleLarge:
          CustomTextTheme.instance!.headline22.copyWith(color: Colors.white),
      titleMedium:
          CustomTextTheme.instance!.headline16.copyWith(color: Colors.white),
      titleSmall:
          CustomTextTheme.instance!.headline14.copyWith(color: Colors.white),
      labelLarge:
          CustomTextTheme.instance!.headline14l.copyWith(color: Colors.white),
      labelMedium:
          CustomTextTheme.instance!.headline12l.copyWith(color: Colors.white),
      labelSmall:
          CustomTextTheme.instance!.headline11l.copyWith(color: Colors.white),
      bodyLarge:
          CustomTextTheme.instance!.headline16b.copyWith(color: Colors.white),
      bodyMedium:
          CustomTextTheme.instance!.headline14b.copyWith(color: Colors.white),
      bodySmall:
          CustomTextTheme.instance!.headline12b.copyWith(color: Colors.white),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xff5d5d5d)),
  );
}
