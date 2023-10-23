import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/cache/cache_manager.dart';

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
    final String themeName = await CacheManager.getTheme();
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
      await CacheManager.setTheme("darkTheme");
    } else {
      state = ThemeProvider.lightTheme;
      await CacheManager.setTheme("lightTheme");
    }
  }

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xffe7e7e7),
    indicatorColor: Colors.black,
    brightness: Brightness.light,
    cardColor: const Color(0xff34b04a),
    shadowColor: const Color(0xffcfdcec),
    splashColor: const Color(0xffF39F5A),
    dialogBackgroundColor: const Color(0xff0af40c),
    canvasColor: const Color(0xfff0f0f0),
    primaryColor: const Color(0xff2371b0),
    disabledColor: const Color(0xff6499E9),
    textTheme: TextTheme(
      bodyLarge:
          CustomTextTheme.instance!.headline38.copyWith(color: Colors.black),
      bodyMedium:
          CustomTextTheme.instance!.headline34.copyWith(color: Colors.black),
      bodySmall:
          CustomTextTheme.instance!.headline28.copyWith(color: Colors.black),
      displayLarge:
          CustomTextTheme.instance!.headline26.copyWith(color: Colors.black),
      labelLarge:
          CustomTextTheme.instance!.headline24.copyWith(color: Colors.black),
      displayMedium:
          CustomTextTheme.instance!.headline20.copyWith(color: Colors.black),
      displaySmall:
          CustomTextTheme.instance!.headline18.copyWith(color: Colors.black),
      headlineLarge:
          CustomTextTheme.instance!.headline16.copyWith(color: Colors.black),
      headlineMedium:
          CustomTextTheme.instance!.headline14.copyWith(color: Colors.black),
      titleLarge: CustomTextTheme.instance!.headline20
          .copyWith(color: Colors.white, letterSpacing: 1),
      labelMedium:
          CustomTextTheme.instance!.headline14.copyWith(color: Colors.white),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xff73a9e6)),
  );

  static final ThemeData darkTheme = ThemeData(
    indicatorColor: Colors.white,
    scaffoldBackgroundColor: const Color(0xff3e484d),
    disabledColor: const Color(0xff6499E9),
    cardColor: const Color(0xff34b04a),
    shadowColor: const Color(0xff343942),
    primaryColor: const Color(0xff5d5d5d),
    splashColor: const Color(0xff204354),
    canvasColor: const Color(0xffcdcdd2),
    dialogBackgroundColor: const Color(0xff557ec2),
    brightness: Brightness.dark,
    textTheme: TextTheme(
      bodyLarge:
          CustomTextTheme.instance!.headline38.copyWith(color: Colors.white),
      bodyMedium:
          CustomTextTheme.instance!.headline34.copyWith(color: Colors.white),
      bodySmall:
          CustomTextTheme.instance!.headline28.copyWith(color: Colors.white),
      displayLarge:
          CustomTextTheme.instance!.headline26.copyWith(color: Colors.white),
      labelLarge:
          CustomTextTheme.instance!.headline24.copyWith(color: Colors.white),
      displayMedium:
          CustomTextTheme.instance!.headline20.copyWith(color: Colors.white),
      displaySmall:
          CustomTextTheme.instance!.headline18.copyWith(color: Colors.white),
      headlineLarge:
          CustomTextTheme.instance!.headline16.copyWith(color: Colors.white),
      headlineMedium:
          CustomTextTheme.instance!.headline14.copyWith(color: Colors.white),
      titleLarge: CustomTextTheme.instance!.headline20
          .copyWith(color: Colors.black, letterSpacing: 1),
      labelMedium:
          CustomTextTheme.instance!.headline14.copyWith(color: Colors.black),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xff5d5d5d)),
  );
}