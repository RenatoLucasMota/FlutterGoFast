import 'package:flutter_gofast/app/interfaces/error_interceptor_interface.dart';

class RegisterErrorInterceptor implements IErrorInterceptor {
  @override
  String handleError(String error) {
    switch (error) {
      case 'ERROR_WEAK_PASSWORD':
        return 'Acho que essa senha está muito curta, tente uma maior!';
        break;
      case 'ERROR_INVALID_EMAIL':
        return 'Ops! Esse email é inválido!';
        break;
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        return 'Esse email já está cadastrado,'
            'se já tem uma conta basta fazer o login!';
        break;
      default:
        return 'Não foi possível realizar o registro,'
            'tente novamente mais tarde.';
    }
  }
}
