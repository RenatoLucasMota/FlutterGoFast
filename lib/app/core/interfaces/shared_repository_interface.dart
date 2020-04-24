import 'package:flutter/material.dart';

abstract class ISharedRepositoryInterface {
  String redUserInfo();
  saveUserInfo(String userInfo);

  Future<ThemeMode> readThemeMode();
  Future<bool> saveThemeMode(ThemeMode themeMode);

}