import 'package:flutter/material.dart';

import 'app_localizations.dart';

class AppTranslate {
  final BuildContext context;

  AppTranslate(this.context);

  String text(String key,
      {Map<String, String> params, String defaultValue = ''}) {
    return AppLocalizations.of(context)
        .translate(key, params: params, defaultValue: defaultValue);
  }
}
