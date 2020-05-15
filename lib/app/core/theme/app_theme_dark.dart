import 'package:flutter/material.dart';
import 'package:flutter_gofast/app/interfaces/theme_app_interface.dart';


class AppThemeDark implements IThemeAppInterface {
  @override
  ThemeData getTheme() {
    return ThemeData.dark();
  }

  @override
  String themeToString() {
    return ThemeMode.dark.toString();
  }
}
