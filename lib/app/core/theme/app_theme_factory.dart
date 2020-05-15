import 'package:flutter/material.dart';
import 'package:flutter_gofast/app/interfaces/theme_app_interface.dart';

import 'app_theme_dark.dart';
import 'app_theme_light.dart';


class AppThemeFactory {
  static IThemeAppInterface getTheme(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.dark:
        return AppThemeDark();
        break;
      case ThemeMode.light:
        return AppThemeLight();
        break;
      default:
        return AppThemeLight();
        break;
    }
  }
}
