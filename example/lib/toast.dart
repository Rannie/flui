import 'package:flutter/material.dart';

enum FLToastPosition {
  center,
  top,
  bottom
}

enum FLToastStyle {
  dark,
  lightBlur
}

class FLToastProvider extends InheritedWidget {
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return this == oldWidget;
  }
}

class FLToast {
  static final FLToastDefaults _defaults = FLToastDefaults();
  static get defaults => _defaults;

  static void loading(String text) => FLToast.showLoading(text, null, _defaults.position, _defaults.style);
  static void showLoading(String text, String detailText, FLToastPosition position, FLToastStyle style) {

  }

  static void text(String text) => FLToast.showText(text, null, _defaults.hideDuration, _defaults.position, _defaults.style);
  static void showText(String text, String detailText, Duration hideDuration, FLToastPosition position, FLToastStyle style) {

  }

  static void success(String text) => FLToast.showSuccess(text, null, _defaults.hideDuration, _defaults.position, _defaults.style);
  static void showSuccess(String text, String detailText, Duration hideDuration, FLToastPosition position, FLToastStyle style) {

  }

  static void error(String text) => FLToast.showError(text, null, _defaults.hideDuration, _defaults.position, _defaults.style);
  static void showError(String text, String detailText, Duration hideDuration, FLToastPosition position, FLToastStyle style) {

  }

  static void info(String text) => FLToast.showInfo(text, null, _defaults.hideDuration, _defaults.position, _defaults.style);
  static void showInfo(String text, String detailText, Duration hideDuration, FLToastPosition position, FLToastStyle style) {

  }
}

class FLToastDefaults {
  FLToastDefaults({
    this.hideDuration = const Duration(seconds: 3),
    this.darkColor = Colors.white,
    this.darkBackgroundColor = Colors.black87,
    this.lightColor = Colors.black12,
    this.position = FLToastPosition.center,
    this.style = FLToastStyle.dark,
    this.dismissOtherToast = true
  });

  Duration hideDuration;
  Color darkColor; // include text & icon
  Color darkBackgroundColor;
  Color lightColor; // include text & icon
  FLToastPosition position;
  FLToastStyle style;
  bool dismissOtherToast;
}

class _FLToastView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}