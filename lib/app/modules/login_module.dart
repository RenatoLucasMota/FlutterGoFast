import 'package:flutter_gofast/app/controllers/login/login_controller.dart';
import 'package:flutter_gofast/app/views/pages/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => LoginController(),
        ),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/',
          child: (_, args) => LoginPage(),
        ),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
