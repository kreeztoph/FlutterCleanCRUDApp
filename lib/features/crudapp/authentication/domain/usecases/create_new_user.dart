import 'package:dartz/dartz.dart';
import 'package:firebasecrud/core/error/failure.dart';
import 'package:firebasecrud/features/crudapp/authentication/data/models/email_password_model.dart';
import 'package:firebasecrud/features/crudapp/authentication/domain/repository/emailPassword_repository.dart';

class CreateNewUser {
  final EmailPasswordRepository repository;

  CreateNewUser(this.repository);

  Future<Either<Failure, void>> call(EmailPasswordModel params) async =>
      await repository.createNewUser(params);
}
