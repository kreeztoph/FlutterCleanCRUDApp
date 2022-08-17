import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebasecrud/core/error/failure.dart';
import 'package:firebasecrud/core/usecases/usecase.dart';
import 'package:firebasecrud/features/crudapp/data/models/user_model.dart';
import 'package:firebasecrud/features/crudapp/domain/repository/user_repository.dart';

class CreateUser extends UseCase<void, Params> {
  final UserRepository repository;

  CreateUser(this.repository);

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return await repository.createUser(params.name, params.age);
  }
}

class Params extends Equatable {
  final String name;
  final int age;

  const Params({
    required this.name,
    required this.age,
  });

  @override
  List<Object?> get props => [name, age];
}
