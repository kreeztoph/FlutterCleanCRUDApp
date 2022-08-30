// ignore_for_file: unused_local_variable, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebasecrud/features/crudapp/CRUD/data/models/user_model.dart';
import 'package:firebasecrud/features/crudapp/CRUD/domain/usecases/delete_user.dart';
import 'package:firebasecrud/features/crudapp/CRUD/domain/usecases/edit_user.dart';
import 'package:firebasecrud/features/crudapp/CRUD/domain/usecases/listen_user.dart';

part 'fetch_users_state.dart';

class FetchUsersCubit extends Cubit<FetchUsersState> {
  final ListUser listUser;
  final DeleteUser deleteUser;
  final EditUser editUser;

  FetchUsersCubit(
      {required this.editUser,
      required this.deleteUser,
      required this.listUser})
      : super(FetchUsersInitial());

  void fetchUserFront() async {
    emit(FetchUsersLoading());
    final users = listUser();
    emit(FetchUsersLoaded(users));
    // print(users);
  }

  void deleteUserListPage(String id) async {
    emit(FetchUsersLoading());
    final delete = await deleteUser(id);
    final users = listUser();
    emit(FetchUsersLoaded(users));
  }

  void editUserListPage(UserModel userModel) async {
    emit(FetchUsersLoading());
    final edit = editUser(userModel);
    final users = listUser();
    emit(FetchUsersLoaded(users));
  }
}
