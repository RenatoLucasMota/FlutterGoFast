import 'package:flutter_gofast/app/core/enums/app_enums.dart';
import 'package:flutter_gofast/app/interfaces/error_interceptor_interface.dart';

import 'response_defult.dart';

class ResponseBuilder {
  static DefaultResponse failed<T>(
      {T object, String message, IErrorInterceptor errorInterceptor}) {
    if (errorInterceptor != null) {
      message = errorInterceptor.handleError(message);
    }
    return DefaultResponse<T>(
        object: object, message: message, status: ResponseStatus.rsFailed);
  }

  static DefaultResponse success<T>(
      {T object, String message, IErrorInterceptor errorInterceptor}) {
    if (errorInterceptor != null) {
      message = errorInterceptor.handleError(message);
    }
    return DefaultResponse<T>(
        object: object, message: message, status: ResponseStatus.rsSuccess);
  }
}
