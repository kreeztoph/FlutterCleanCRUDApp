// ignore_for_file: non_constant_identifier_names

import 'package:firebasecrud/features/crudapp/authentication/domain/entities/emailPassword.dart';

class EmailPasswordModel {
  final String? id;
  final String name;
  String? password;
  final String email;

  EmailPasswordModel({
    this.id,
    required this.name,
    required this.email,
    this.password,
  }) : super();

  factory EmailPasswordModel.fromJson(Map<String, dynamic> data) {
    return EmailPasswordModel(
      id: data['id'],
      name: data['name'],
      email: data['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
