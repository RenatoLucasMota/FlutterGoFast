import 'package:flutter_gofast/app/core/consts/routers_const.dart';
import 'package:flutter_gofast/app/interfaces/auth_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthController {
  IAuthRepository authRepository;

  AuthController() {
    authRepository = Modular.get<IAuthRepository>();
  }

  Future<void> doLoginGoogle() async {
    await authRepository.doLoginGoogle().then((value) {
      if (value.success) {
        Modular.to.pushNamed(RoutersConst.home);
      } else {
        print(value.message);
      }
    });
  }

  Future<void> doLoginEmail(String email, String password) async {
    await authRepository
        .doLoginEmailPassword(email: email.trim(), password: password.trim())
        .then((value) {
      if (value.success) {
        Modular.to.pushNamed(RoutersConst.home);
      } else {
        print(value.message);
      }
    });
  }
}
