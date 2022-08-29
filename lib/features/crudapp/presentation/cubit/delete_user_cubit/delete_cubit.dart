// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebasecrud/core/error/failure.dart';
import 'package:firebasecrud/features/crudapp/domain/usecases/delete_user.dart';

part 'delete_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class DeleteCubit extends Cubit<DeleteState> {
  final DeleteUser deleteUser;
  DeleteCubit(this.deleteUser)
      : super(
          DeleteInitial(),
        );

  Future<void> deleteUserFront(String id) async {
    emit(DeleteLoading());
    final user_del = await deleteUser(id);
    emit(user_del.fold(
        (failure) => Error(message: mapFailureToMessage(failure)),
        (user_del) => DeleteComplete()));
  }

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
