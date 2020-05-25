import 'package:flutter_gofast/app/controllers/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:mobx/mobx.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {

  @observable 
  String email = '';

  @observable 
  String senha = '';

  @action 
  void setEmail(String value) {
    email = value;
  }

  @action 
  void setSenha(String value) {
    senha = value;
  }

  var _authController;
  
  _RegisterControllerBase() {
    _authController = Modular.get<AuthController>();
  }

  Future<void> doRegister() async {
    return await _authController.doRegisterEmail();
  }
}
