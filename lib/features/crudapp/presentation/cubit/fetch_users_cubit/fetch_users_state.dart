part of 'fetch_users_cubit.dart';

abstract class FetchUsersState extends Equatable {
  const FetchUsersState();

  @override
  List<Object> get props => [];
}

class FetchUsersInitial extends FetchUsersState {}

class FetchUsersLoading extends FetchUsersState {}

class FetchUsersLoaded extends FetchUsersState {
  final Stream<List<UserModel>> users;

  FetchUsersLoaded(this.users);

  @override
  List<Object> get props => [users];
}

class FetchUsersError extends FetchUsersState {
  final String message;

  const FetchUsersError({required this.message});

  @override
  List<Object> get props => [message];
}
