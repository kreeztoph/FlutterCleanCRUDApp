// ignore_for_file: depend_on_referenced_packages, unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebasecrud/features/crudapp/CRUD/data/models/user_model.dart';
import 'package:firebasecrud/features/crudapp/CRUD/domain/usecases/edit_user.dart';
import 'package:firebasecrud/features/crudapp/CRUD/domain/usecases/listen_user.dart';

part 'edit_user_cubit_state.dart';

class EditUserCubit extends Cubit<EditUserCubitState> {
  final ListUser listUser;
  final EditUser editUser;
  EditUserCubit({
    required this.listUser,
    required this.editUser,
  }) : super(EditUserCubitInitial());

  void fetchUsersForEdit() async {
    //Loading state for when the page is called
    emit(EditUserCubitLoading());

    //Gets the database Users
    final users = listUser();

    //When loading is successful
    emit(EditUserCubitLoaded(users: users));
  }

  void editUsers(UserModel userModel) async {
    //Loading state for when the function is called
    emit(EditUserCubitLoading());
    //passess the edited value
    final edit = editUser(userModel);
    //calls the updated list again
    final users = listUser();
    emit(EditUserCubitLoaded(users: users));
  }
}
