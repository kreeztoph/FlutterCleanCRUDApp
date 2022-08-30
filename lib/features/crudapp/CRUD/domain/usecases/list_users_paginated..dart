// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasecrud/features/crudapp/CRUD/data/models/user_model.dart';
import 'package:firebasecrud/features/crudapp/CRUD/domain/repository/user_repository.dart';

class ListUserPaginated {
  final UserRepository repository;

  ListUserPaginated(this.repository);

  CollectionReference<UserModel> call() => repository.listPaginatedUsers();
}
