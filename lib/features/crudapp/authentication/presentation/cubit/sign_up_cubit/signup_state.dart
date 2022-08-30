part of 'signup_cubit.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupLoaded extends SignupState {}

class Error extends SignupState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
