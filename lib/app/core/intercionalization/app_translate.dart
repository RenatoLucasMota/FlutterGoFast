import 'package:flutter/material.dart';
import 'package:flutter_gofast/app/core/intercionalization/app_localizations.dart';

class AppTranslate {
  final BuildContext context;

  AppTranslate(this.context);

  String text(String key) {
    return AppLocalizations.of(context).translate(key);
  }
}
