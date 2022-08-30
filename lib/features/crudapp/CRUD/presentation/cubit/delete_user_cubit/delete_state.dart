part of 'delete_cubit.dart';

abstract class DeleteState extends Equatable {
  const DeleteState();

  @override
  List<Object> get props => [];
}

class DeleteInitial extends DeleteState {}

class DeleteLoading extends DeleteState {}

class DeleteComplete extends DeleteState {}

class Error extends DeleteState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
