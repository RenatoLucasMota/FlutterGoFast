

import 'package:flutter_gofast/app/core/enums/app_enums.dart';

class DefaultResponse<T> {
  final T object;
  String message;
  final ResponseStatus status;

  bool get success => status == ResponseStatus.rsSuccess;

  bool get failed => status == ResponseStatus.rsFailed;

  DefaultResponse({this.object, this.message, this.status});
}
