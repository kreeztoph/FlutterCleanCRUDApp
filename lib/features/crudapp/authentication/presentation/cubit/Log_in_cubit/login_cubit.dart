import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebasecrud/core/error/failure.dart';
import 'package:firebasecrud/features/crudapp/authentication/domain/entities/emailPassword.dart';
import 'package:firebasecrud/features/crudapp/authentication/domain/usecases/login_user.dart';

part 'login_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class LoginCubit extends Cubit<LoginState> {
  final LoginUser loginUser;
  LoginCubit({required this.loginUser}) : super(LoginInitial());

  Future<void> logInUser(EmailPassword params) async {
    emit(LoginLoading());
    print('-----------------------');
    print('${params.email}');
    print('${params.password}');
    final res = await loginUser(params);
    emit(res.fold((failure) => Error(message: mapFailureToMessage(failure)),
        (res) => LoginLoaded()));
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
