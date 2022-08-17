import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasecrud/features/crudapp/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<void> createUser(String name, int age);
  Future<void> deleteUser(String name);
  Future<void> editUser(UserModel params);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  UserRemoteDataSourceImpl({required this.firebaseFirestore});

  @override
  Future<void> createUser(String name, int age) {
    final response =
        firebaseFirestore.collection('user').add(jsonEncode(toJson(age, name)));
    return response;
  }

  @override
  Future<void> deleteUser(String name) {
    final response = firebaseFirestore.collection('user').doc(name).delete();
    return response;
  }

  @override
  Future<void> editUser(UserModel params) {
    final response = firebaseFirestore
        .collection('user')
        .doc(params.name)
        .update(params.toJson());
    return response;
  }
}
