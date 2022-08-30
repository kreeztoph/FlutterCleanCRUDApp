part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {}

class Error extends UserState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
