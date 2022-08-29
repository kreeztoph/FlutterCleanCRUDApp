import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasecrud/core/usecases/usecase.dart';
import 'package:firebasecrud/features/crudapp/data/models/user_model.dart';
import 'package:firebasecrud/features/crudapp/domain/repository/user_repository.dart';

class ListUserPaginated {
  final UserRepository repository;

  ListUserPaginated(this.repository);

  CollectionReference<UserModel> call() => repository.listPaginatedUsers();
}
