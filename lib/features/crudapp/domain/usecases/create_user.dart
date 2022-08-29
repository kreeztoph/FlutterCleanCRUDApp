import 'package:dartz/dartz.dart';
import 'package:firebasecrud/core/error/failure.dart';
import 'package:firebasecrud/core/usecases/usecase.dart';
import 'package:firebasecrud/features/crudapp/data/models/user_model.dart';
import 'package:firebasecrud/features/crudapp/domain/repository/user_repository.dart';

class CreateUser extends UseCase<void, UserModel> {
  final UserRepository repository;

  CreateUser(this.repository);

  @override
  Future<Either<Failure, void>> call(UserModel params) async {
    return await repository.createUser(params);
  }
}
