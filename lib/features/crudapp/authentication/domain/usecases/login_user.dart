// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:firebasecrud/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasecrud/features/crudapp/authentication/domain/entities/emailPassword.dart';
import 'package:firebasecrud/features/crudapp/authentication/domain/repository/emailPassword_repository.dart';

class LoginUser {
  final EmailPasswordRepository repository;

  LoginUser(this.repository);

  Future<Either<Failure, User>> call(EmailPassword params) async =>
      await repository.loginUser(params);
}
