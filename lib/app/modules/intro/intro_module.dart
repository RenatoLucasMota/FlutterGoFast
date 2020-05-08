import 'package:flutter_modular/flutter_modular.dart';

import 'intro_controller.dart';
import 'intro_page.dart';

class IntroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => IntroController(),
        ),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/login',
          child: (_, args) => IntroPage(),
        ),
      ];

  static Inject get to => Inject<IntroModule>.of();
}
