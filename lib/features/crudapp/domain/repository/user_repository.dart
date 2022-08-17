import 'package:dartz/dartz.dart';
import 'package:firebasecrud/core/error/failure.dart';
import 'package:firebasecrud/features/crudapp/data/models/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> createUser(
    String name,
    int age,
  );
  Future<Either<Failure, void>> editUser(UserModel params);
  Future<Either<Failure, void>> deleteUser(String name);
}
