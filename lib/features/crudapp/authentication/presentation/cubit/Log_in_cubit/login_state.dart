part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {}

class Error extends LoginState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
