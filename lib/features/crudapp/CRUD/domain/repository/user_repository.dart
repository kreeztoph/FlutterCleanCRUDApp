import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebasecrud/core/error/failure.dart';
import 'package:firebasecrud/features/crudapp/CRUD/data/models/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> createUser(UserModel params);
  Future<Either<Failure, void>> editUser(UserModel params);
  Future<Either<Failure, void>> deleteUser(String id);
  Stream<List<UserModel>> listenToUsers();
  CollectionReference<UserModel> listPaginatedUsers();
}
