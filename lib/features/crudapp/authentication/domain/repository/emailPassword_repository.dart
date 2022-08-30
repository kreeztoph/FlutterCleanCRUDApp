// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:firebasecrud/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasecrud/features/crudapp/authentication/data/models/email_password_model.dart';
import 'package:firebasecrud/features/crudapp/authentication/domain/entities/emailPassword.dart';

abstract class EmailPasswordRepository {
  Future<Either<Failure, void>> createNewUser(EmailPasswordModel params);
  Future<Either<Failure, User>> loginUser(EmailPassword params);
  Future<Either<Failure, User>> registerUser(EmailPassword params);
}
