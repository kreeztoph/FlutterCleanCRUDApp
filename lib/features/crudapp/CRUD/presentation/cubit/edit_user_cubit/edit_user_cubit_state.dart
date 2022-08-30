// ignore_for_file: prefer_const_constructors_in_immutables

part of 'edit_user_cubit_cubit.dart';

abstract class EditUserCubitState extends Equatable {
  const EditUserCubitState();

  @override
  List<Object> get props => [];
}

class EditUserCubitInitial extends EditUserCubitState {}

class EditUserCubitLoading extends EditUserCubitState {}

class EditUserCubitLoaded extends EditUserCubitState {
  final Stream<List<UserModel>> users;

  EditUserCubitLoaded({required this.users});
  @override
  List<Object> get props => [users];
}

class EditUserError extends EditUserCubitState {
  final String message;

  const EditUserError({required this.message});

  @override
  List<Object> get props => [message];
}
