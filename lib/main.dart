import 'package:flutter/material.dart';
import 'package:flutter_gofast/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ModularApp(
      module: AppModule(),
    ),
  );
}
