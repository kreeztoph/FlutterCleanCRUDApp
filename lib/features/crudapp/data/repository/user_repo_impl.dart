import 'package:dartz/dartz.dart';
import 'package:firebasecrud/core/error/exception.dart';
import 'package:firebasecrud/core/error/failure.dart';
import 'package:firebasecrud/core/network/network_info.dart';
import 'package:firebasecrud/features/crudapp/data/datasources/user_remote_data_source.dart';
import 'package:firebasecrud/features/crudapp/data/models/user_model.dart';
import 'package:firebasecrud/features/crudapp/domain/repository/user_repository.dart';

typedef Future<void> _Checker();

class UserRepoImpl implements UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;
  final NetworkInfo networkInfo;

  UserRepoImpl(
    this._userRemoteDataSource,
    this.networkInfo,
  );

  @override
  Future<Either<Failure, void>> createUser(String name, int age) {
    return _UserIntercept(() => _userRemoteDataSource.createUser(name, age));
  }

  @override
  Future<Either<Failure, void>> deleteUser(String name) {
    return _UserIntercept(() => _userRemoteDataSource.deleteUser(name));
  }

  @override
  Future<Either<Failure, void>> editUser(UserModel params) {
    return _UserIntercept(() => _userRemoteDataSource.editUser(params));
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
}
