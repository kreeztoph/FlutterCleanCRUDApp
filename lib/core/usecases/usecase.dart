import 'package:dartz/dartz.dart';
import 'package:firebasecrud/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UsecaseList<ParamsList> {
  Stream<List<ParamsList>> call();
}
