import 'package:flutter/material.dart';

class FLColors {
  static const int primaryLightestValue = 0xFFA0DFFC;
  static const int primaryLightValue = 0xFF63C9F8;
  static const int primaryValue = 0xFF0F4C81;
  static const int primaryDarkValue = 0xFF1D5B9A;

  static const MaterialColor primarySwatch = const MaterialColor(
    primaryValue,
    const <int, Color>{
      50: const Color(primaryLightestValue),
      100: const Color(primaryLightestValue),
      200: const Color(primaryLightValue),
      300: const Color(primaryLightValue),
      400: const Color(primaryLightValue),
      500: const Color(primaryValue),
      600: const Color(primaryDarkValue),
      700: const Color(primaryDarkValue),
      800: const Color(primaryDarkValue),
      900: const Color(primaryDarkValue),
    },
  );

  static const int textWhite = 0xFFFFFFFF;
  static const Color primaryColor = Color(primaryValue);
}