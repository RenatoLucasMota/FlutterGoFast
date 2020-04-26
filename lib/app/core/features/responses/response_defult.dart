import '../../../core/enums/app_enums.dart';

class DefaultResponse<T> {
  final T object;
  final String message;
  final ResponseStatus status;

  DefaultResponse({this.object, this.message, this.status});
}
