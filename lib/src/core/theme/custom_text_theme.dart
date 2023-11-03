import 'package:flutter/material.dart';

final class CustomTextTheme {
  CustomTextTheme._init();
  static CustomTextTheme? _instance;
  static CustomTextTheme? get instance {
    _instance ??= CustomTextTheme._init();
    return _instance;
  }

  final TextStyle headline57 = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );
  final TextStyle headline45 = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 45,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );
  final TextStyle headline36 = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 36,
    fontWeight: FontWeight.w300,
    letterSpacing: 0,
  );
  final TextStyle headline32 = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 32,
    fontWeight: FontWeight.w300,
    letterSpacing: 0,
  );
  final TextStyle headline28 = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 28,
    fontWeight: FontWeight.w300,
    letterSpacing: 0,
  );
  final TextStyle headline24 = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 24,
    fontWeight: FontWeight.w300,
    letterSpacing: 0,
  );
  final TextStyle headline22 = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 22,
    fontWeight: FontWeight.w300,
    letterSpacing: 0,
  );
  final TextStyle headline16 = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 16,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.15,
  );
  final TextStyle headline14 = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 14,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.1,
  );
  final TextStyle headline14l = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 14,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.1,
  );
  final TextStyle headline12l = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 12,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.5,
  );
  final TextStyle headline11l = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 11,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.5,
  );
  final TextStyle headline16b = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 16,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.15,
  );
  final TextStyle headline14b = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 14,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.25,
  );
  final TextStyle headline12b = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 12,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.4,
  );
}
