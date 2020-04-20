import 'package:flutter/material.dart';
import 'package:flutter_gofast/app/core/interfaces/shared_repository_interface.dart';
import 'package:flutter_gofast/app/core/interfaces/theme_app_interface.dart';
import 'package:flutter_gofast/app/core/repositories/shared_repository.dart';
import 'package:flutter_gofast/app/core/theme/app_theme_dark.dart';
import 'package:flutter_gofast/app/core/theme/app_theme_light.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  SharedRepository sharedRepository = Modular.get<ISharedRepositoryInterface>();
  _AppControllerBase() {
    getThemeData();
  }
  @observable
  IThemeAppInterface themeApp = AppThemeLight();

  @action
  getThemeData() async {
    await sharedRepository.getValue<String>('theme_mode').then(
      (value) {
        setThemeData(
            value == 'ThemeMode.dark' ? ThemeMode.dark : ThemeMode.light,
            saveShared: false);
      },
    );
  }

  @action
  setThemeData(ThemeMode themeMode, {bool saveShared = true}) async {
    switch (themeMode) {
      case ThemeMode.dark:
        themeApp = AppThemeDark();
        break;
      default:
        themeApp = AppThemeLight();
        break;
    }
    if (saveShared) {
      await sharedRepository.setValue('theme_mode', themeMode.toString());
    }
  }
}
