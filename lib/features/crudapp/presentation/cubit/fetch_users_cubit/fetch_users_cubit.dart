import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebasecrud/features/crudapp/domain/usecases/edit_user.dart';
import 'package:firebasecrud/features/crudapp/domain/usecases/listen_user.dart';

part 'fetch_users_state.dart';

class FetchUsersCubit extends Cubit<FetchUsersState> {
  final ListUser listUser;

  FetchUsersCubit(this.listUser) : super(FetchUsersInitial());

  Stream<List> fetchUserFront() {
    emit(FetchUsersLoading());
    final users = listUser();
    emit(FetchUsersLoaded());
  }
}
