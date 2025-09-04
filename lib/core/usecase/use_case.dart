import 'package:bookly/core/errors/failures_app.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Param> {
  // any data type : استقبلها ب Type : and Param :
  Future<Either<FailuresApp, Type>> call([Param param]);
}

class NoParam {
  // no parameters :
}
