// ignore_for_file: non_constant_identifier_names, prefer_generic_function_type_aliases

import 'package:dartz/dartz.dart';
import 'package:firebasecrud/core/error/exception.dart';
import 'package:firebasecrud/core/error/failure.dart';
import 'package:firebasecrud/core/network/network_info.dart';
import 'package:firebasecrud/features/crudapp/data/datasources/user_remote_data_source.dart';
import 'package:firebasecrud/features/crudapp/data/models/user_model.dart';
import 'package:firebasecrud/features/crudapp/domain/repository/user_repository.dart';

typedef Future<void> _Checker();

class UserRepoImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;
  final NetworkInfo networkInfo;

  UserRepoImpl({
    required this.userRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, void>> createUser(UserModel params) {
    return _UserIntercept(() => userRemoteDataSource.createUser(params));
  }

  @override
  Future<Either<Failure, void>> deleteUser(String id) {
    return _UserIntercept(() => userRemoteDataSource.deleteUser(id));
  }

  @override
  Future<Either<Failure, void>> editUser(UserModel params) {
    return _UserIntercept(() => userRemoteDataSource.editUser(params));
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

  @override
  Stream<List<UserModel>> listenToUsers() {
    return userRemoteDataSource.listUser();
  }
}
