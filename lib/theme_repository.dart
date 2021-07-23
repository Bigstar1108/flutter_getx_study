import 'package:flutter/material.dart';
import 'package:flutter_getx_study/global_repository.dart';

import 'package:get/get.dart';

class ThemeRepository {
  const ThemeRepository();

  static const String _systemColorThemeKey = 'system';
  static const String _darkColorThemeKey = 'dark';
  static const String _lightColorThemeKey = 'light';

  static const String _appThemeKey = 'themeKey';

  ThemeMode get themeMode {
    switch (GlobalRepository().pref!.getString(_appThemeKey)) {
      case _lightColorThemeKey:
        return ThemeMode.light;
      case _darkColorThemeKey:
        return ThemeMode.dark;
      case _systemColorThemeKey:
      default:
        return ThemeMode.system;
    }
  }

  void saveThemeMode(String themeModeKey) async {
    var pref = GlobalRepository().pref!;

    await pref.setString(_appThemeKey, themeModeKey);
  }

  void changeThemeMode(ThemeMode themeMode) {
    Get.changeThemeMode(themeMode);

    switch (themeMode) {
      case ThemeMode.light:
        saveThemeMode(_lightColorThemeKey);
        break;
      case ThemeMode.dark:
        saveThemeMode(_darkColorThemeKey);
        break;
      case ThemeMode.system:
      default:
        saveThemeMode(_systemColorThemeKey);
        break;
    }
  }
}
