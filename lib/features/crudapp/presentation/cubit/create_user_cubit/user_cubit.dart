import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebasecrud/core/error/failure.dart';
import 'package:firebasecrud/features/crudapp/data/models/user_model.dart';
import 'package:firebasecrud/features/crudapp/domain/entities/user.dart';
import 'package:firebasecrud/features/crudapp/domain/usecases/create_user.dart';
import 'package:firebasecrud/features/crudapp/domain/usecases/edit_user.dart';
import 'package:firebasecrud/features/crudapp/domain/usecases/listen_user.dart';

part 'user_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class UserCubit extends Cubit<UserState> {
  final CreateUser createUser;

  UserCubit({required this.createUser})
      : super(
          UserInitial(),
        );

  Future<void> createUserFront(UserModel params) async {
    emit(UserLoading());
    final user = await createUser(
      UserModel(name: params.name, age: params.age),
    );
    emit(user.fold((failure) => Error(message: mapFailureToMessage(failure)),
        (user) => UserLoaded()));
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

  String mapUserCreated(User user) {
    return 'User created Successfuly';
  }
}
