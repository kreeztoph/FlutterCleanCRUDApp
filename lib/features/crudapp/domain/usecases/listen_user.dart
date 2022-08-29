import 'package:firebasecrud/core/usecases/usecase.dart';
import 'package:firebasecrud/features/crudapp/data/models/user_model.dart';
import 'package:firebasecrud/features/crudapp/domain/repository/user_repository.dart';

class ListUser extends UsecaseList<UserModel> {
  final UserRepository repository;

  ListUser(this.repository);

  @override
  Stream<List<UserModel>> call() => repository.listenToUsers();
}
