import 'package:firebasecrud/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebasecrud/core/usecases/usecase.dart';
import 'package:firebasecrud/features/crudapp/domain/repository/user_repository.dart';

class DeleteUser extends UseCase<void, String> {
  final UserRepository repository;

  DeleteUser(this.repository);

  @override
  // ignore: avoid_renaming_method_parameters
  Future<Either<Failure, void>> call(String id) async {
    return await repository.deleteUser(id);
  }
}
