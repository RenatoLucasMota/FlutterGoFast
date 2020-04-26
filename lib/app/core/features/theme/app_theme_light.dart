import 'package:flutter/material.dart';
import '../../../core/interfaces/theme_app_interface.dart';

class AppThemeLight implements IThemeAppInterface {
  @override
  ThemeData getTheme() {
    return ThemeData.light();
  }

  @override
  String themeToString() {
    return ThemeMode.light.toString();
  }
}
