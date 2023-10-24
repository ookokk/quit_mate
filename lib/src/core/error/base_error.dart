import 'package:quit_mate/src/core/network/iresponse_model.dart';

class BaseError<T> extends IErrorModel<T> {
  BaseError(this.message);
  final String message;
}