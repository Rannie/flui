import 'package:flutter/material.dart';

/// the icon position of button with icon.
enum FLPosition { top, left, bottom, right }

extension ThemeFluiExt on Theme {
  static FLThemeData? get fluiThemeData {
    return null;
  }

  static set configFluiTheme(FLThemeData flThemeData) {}
}

class FLThemeData {
  static FLThemeData? get sharedThemeData {
    return null;
  }
}
