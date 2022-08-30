// ignore_for_file: library_private_types_in_public_api

import 'package:firebasecrud/core/error/exception.dart';
import 'package:firebasecrud/core/network/network_info.dart';
import 'package:firebasecrud/features/crudapp/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:firebasecrud/features/crudapp/authentication/data/models/email_password_model.dart';
import 'package:firebasecrud/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:firebasecrud/features/crudapp/authentication/domain/entities/emailPassword.dart';
import 'package:firebasecrud/features/crudapp/authentication/domain/repository/emailPassword_repository.dart';
import 'package:flutter/services.dart';

typedef Future<void> _Checker();
typedef _SuccessFailureTypeDef = Function();

class EmailPasswordRepoImpl implements EmailPasswordRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfo networkInfo;

  EmailPasswordRepoImpl({
    required this.authRemoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, void>> createNewUser(EmailPasswordModel params) {
    return _UserIntercept(() => authRemoteDataSource.postCreateUser(params));
  }

  @override
  Future<Either<Failure, User>> loginUser(EmailPassword params) {
    return successFailureInterceptor(
        () => authRemoteDataSource.postLoginUser(params));
  }

  @override
  Future<Either<Failure, User>> registerUser(EmailPassword params) {
    return successFailureInterceptor(
        () => authRemoteDataSource.postRegisterUser(params));
  }

  Future<Either<Failure, void>> _UserIntercept(_Checker checker) async {
    await networkInfo.isDeviceConnected;
    try {
      final remoteuser = await checker();
      return Right(remoteuser);
    } on ServerException {
      return left(ServerFailure());
    }
  }

  Future<Either<Failure, T>> successFailureInterceptor<T>(
    _SuccessFailureTypeDef func,
  ) async {
    await networkInfo.isDeviceConnected;
    try {
      final T result = func as T;
      return Right(result);
    } on FirebaseAuthException {
      return Left(AuthFailure());
    } on FirebaseException {
      return Left(FirebaseFailure());
    } on PlatformException {
      return left(PlatformFailure());
    } on GeneralException {
      return left(GeneralFailure());
    }
  }
}
