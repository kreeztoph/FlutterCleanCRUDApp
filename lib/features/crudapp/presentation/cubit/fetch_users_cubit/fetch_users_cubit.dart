import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebasecrud/features/crudapp/data/models/user_model.dart';
import 'package:firebasecrud/features/crudapp/domain/entities/user.dart';
import 'package:firebasecrud/features/crudapp/domain/usecases/delete_user.dart';
import 'package:firebasecrud/features/crudapp/domain/usecases/edit_user.dart';
import 'package:firebasecrud/features/crudapp/domain/usecases/listen_user.dart';

part 'fetch_users_state.dart';

class FetchUsersCubit extends Cubit<FetchUsersState> {
  final ListUser listUser;
  final DeleteUser deleteUser;

  FetchUsersCubit({required this.deleteUser, required this.listUser})
      : super(FetchUsersInitial());

  void fetchUserFront() async {
    emit(FetchUsersLoading());
    final users = listUser();
    emit(FetchUsersLoaded(users));
    // print(users);
  }

  void deleteUserListPage(String id) async {
    final delete = await deleteUser(id);
  }
}
