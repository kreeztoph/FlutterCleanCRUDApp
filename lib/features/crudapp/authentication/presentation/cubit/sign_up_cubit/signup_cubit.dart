import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebasecrud/core/error/failure.dart';
import 'package:firebasecrud/features/crudapp/authentication/domain/entities/emailPassword.dart';
import 'package:firebasecrud/features/crudapp/authentication/domain/usecases/register_user.dart';

part 'signup_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class SignupCubit extends Cubit<SignupState> {
  final RegisterNewUser registerNewUser;
  SignupCubit({required this.registerNewUser}) : super(SignupInitial());

  Future<void> signUpNewUser(EmailPassword params) async {
    emit(SignupLoading());

    final res = await registerNewUser(params);
    emit(res.fold((failure) => Error(message: mapFailureToMessage(failure)),
        (res) => SignupLoaded()));
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
