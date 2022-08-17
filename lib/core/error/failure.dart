import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

//general failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class FirebaseFailure extends Failure {}

class GeneralFailure extends Failure {}
