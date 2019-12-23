import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String LightThemeModeString = 'LightThemeModeString';
const String DarkThemeModeString = 'DarkThemeModeString';
const String SystemThemeModeString = 'SystemThemeModeString';
const String _themeModeKey = '_themeModeKey';

class Util {
  static final EventBus eventBus = EventBus();
  static SharedPreferences preferences;

  static void initialize() async {
    preferences = await SharedPreferences.getInstance();
    Util.eventBus.fire('themeLoaded');
  }

  static ThemeMode get themeMode {
    if (Util.preferences == null) return ThemeMode.system;

    String themeModeString =
        Util.preferences.getString(_themeModeKey) ?? SystemThemeModeString;
    if (themeModeString == LightThemeModeString) return ThemeMode.light;
    if (themeModeString == DarkThemeModeString)
      return ThemeMode.dark;
    else
      return ThemeMode.system;
  }

  static setThemeMode(ThemeMode themeMode) {
    if (themeMode == ThemeMode.dark)
      Util.preferences.setString(_themeModeKey, DarkThemeModeString);
    else
      Util.preferences.setString(_themeModeKey, LightThemeModeString);
  }
}
