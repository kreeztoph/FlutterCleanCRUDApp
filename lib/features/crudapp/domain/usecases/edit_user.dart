import 'package:dartz/dartz.dart';
import 'package:firebasecrud/core/error/failure.dart';
import 'package:firebasecrud/core/usecases/usecase.dart';
import 'package:firebasecrud/features/crudapp/data/models/user_model.dart';
import 'package:firebasecrud/features/crudapp/domain/repository/user_repository.dart';

class EditUser extends UseCase<void, UserModel> {
  final UserRepository repository;

  EditUser(this.repository);

  @override
  Future<Either<Failure, void>> call(UserModel params) async {
    return await repository.editUser(params);
  }
}
