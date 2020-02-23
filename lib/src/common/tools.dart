import 'package:flutter/material.dart';

class FLThemeColors {
  static const String primaryColor = 'primaryColor';
  static const String primaryColorLight = 'primaryColorLight';
  static const String primaryColorDark = 'primaryColorDark';
  static const String accentColor = 'accentColor';
  static const String canvasColor = 'canvasColor';
  static const String scaffoldBackgroundColor = 'scaffoldBackgroundColor';
  static const String bottomAppBarColor = 'bottomAppBarColor';
  static const String cardColor = 'cardColor';
  static const String dividerColor = 'dividerColor';
  static const String focusColor = 'focusColor';
  static const String hoverColor = 'hoverColor';
  static const String highlightColor = 'highlightColor';
  static const String splashColor = 'splashColor';
  static const String selectedRowColor = 'selectedRowColor';
  static const String unselectedWidgetColor = 'unselectedWidgetColor';
  static const String disabledColor = 'disabledColor';
  static const String buttonColor = 'buttonColor';
  static const String secondaryHeaderColor = 'secondaryHeaderColor';
  static const String textSelectionColor = 'textSelectionColor';
  static const String cursorColor = 'cursorColor';
  static const String textSelectionHandleColor = 'textSelectionHandleColor';
  static const String backgroundColor = 'backgroundColor';
  static const String dialogBackgroundColor = 'dialogBackgroundColor';
  static const String indicatorColor = 'indicatorColor';
  static const String hintColor = 'hintColor';
  static const String errorColor = 'errorColor';
  static const String toggleableActiveColor = 'toggleableActiveColor';
}

class FLColorTool {
  static Color parseColor(String colorStr, BuildContext ctx) {
    if (colorStr == null) return null;
    if (colorStr.startsWith('@theme')) {
      // built in theme pattern like '@theme.primaryColor'.
      var descriptor = colorStr.split('.').last;
      ThemeData theme = Theme.of(ctx);
      switch (descriptor) {
        case FLThemeColors.primaryColor: return theme.primaryColor;
        case FLThemeColors.primaryColorLight: return theme.primaryColorLight;
        case FLThemeColors.primaryColorDark: return theme.primaryColorDark;
        case FLThemeColors.accentColor: return theme.accentColor;
        case FLThemeColors.canvasColor: return theme.canvasColor;
        case FLThemeColors.scaffoldBackgroundColor: return theme.scaffoldBackgroundColor;
        case FLThemeColors.bottomAppBarColor: return theme.bottomAppBarColor;
        case FLThemeColors.cardColor: return theme.cardColor;
        case FLThemeColors.dividerColor: return theme.dividerColor;
        case FLThemeColors.focusColor: return theme.focusColor;
        case FLThemeColors.hoverColor: return theme.hoverColor;
        case FLThemeColors.highlightColor: return theme.highlightColor;
        case FLThemeColors.splashColor: return theme.splashColor;
        case FLThemeColors.selectedRowColor: return theme.selectedRowColor;
        case FLThemeColors.unselectedWidgetColor: return theme.unselectedWidgetColor;
        case FLThemeColors.disabledColor: return theme.disabledColor;
        case FLThemeColors.secondaryHeaderColor: return theme.secondaryHeaderColor;
        case FLThemeColors.textSelectionColor: return theme.textSelectionColor;
        case FLThemeColors.cursorColor: return theme.cursorColor;
        case FLThemeColors.textSelectionHandleColor: return theme.textSelectionHandleColor;
        case FLThemeColors.backgroundColor: return theme.backgroundColor;
        case FLThemeColors.dialogBackgroundColor: return theme.dialogBackgroundColor;
        case FLThemeColors.indicatorColor: return theme.indicatorColor;
        case FLThemeColors.hintColor: return theme.hintColor;
        case FLThemeColors.errorColor: return theme.errorColor;
        case FLThemeColors.toggleableActiveColor: return theme.toggleableActiveColor;
        default: return null;
      }
    } else {
      return Color(num.parse(colorStr));
    }
  }
}