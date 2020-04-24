import 'package:flutter/material.dart';
import 'package:flutter_gofast/app/core/features/local_storage/local_storage.dart';
import 'package:flutter_gofast/app/core/interfaces/shared_repository_interface.dart';

class SharedRepository implements ISharedRepositoryInterface {
  static const String THEME_MODE = 'theme_mode';
  static const String THEME_MODE_DARK = "ThemeMode.dark";
  static const String THEME_MODE_LIGHT = "ThemeMode.light";

  @override
  String redUserInfo() {
    return null;
  }

  @override
  saveUserInfo(String userInfo) {
    return null;
  }

  @override
  Future<ThemeMode> readThemeMode() async {
    return await LocalStorage.getValue<String>(THEME_MODE).then((value) {
      switch (value) {
        case THEME_MODE_DARK:
          return ThemeMode.dark;
          break;
        case THEME_MODE_LIGHT:
          return ThemeMode.light;
          break;
        default:
          return ThemeMode.light;
          break;
      }
    });
  }

  @override
  Future<bool> saveThemeMode(ThemeMode themeMode) async {
    return await LocalStorage.setValue<String>(
        THEME_MODE, themeMode.toString());
  }
}
