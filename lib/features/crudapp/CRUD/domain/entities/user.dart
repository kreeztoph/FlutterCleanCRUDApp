import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? name;
  final int? age;

  const User({required this.id, required this.name, required this.age});

  @override
  List<Object?> get props => [
        id,
        name,
        age,
      ];
}
