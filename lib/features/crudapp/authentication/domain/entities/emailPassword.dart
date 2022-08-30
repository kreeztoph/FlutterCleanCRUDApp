// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';

class EmailPassword extends Equatable {
  final String? email;
  final String? password;

  EmailPassword({required this.email, this.password});

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
