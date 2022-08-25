import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasecrud/features/crudapp/data/models/user_model.dart';
import 'package:http/http.dart';

abstract class UserRemoteDataSource {
  Future<void> createUser(UserModel params);
  Future<void> deleteUser(String name);
  Future<void> editUser(UserModel params);
  Stream<List<UserModel>> listUser();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  UserRemoteDataSourceImpl({required this.firebaseFirestore});

  @override
  Future<void> createUser(UserModel params) {
    final response = firebaseFirestore
        .collection('users')
        .add(params.toJson())
        .then((value) => value.update({'id': value.id}));

    return response;
  }

  @override
  Future<void> deleteUser(String id) {
    final response = firebaseFirestore.collection('users').doc(id).delete();
    return response;
  }

  @override
  Future<void> editUser(UserModel params) {
    final response = firebaseFirestore
        .collection('users')
        .doc(params.name)
        .update(params.toJson());
    return response;
  }

  @override
  Stream<List<UserModel>> listUser() {
    final response = firebaseFirestore
        .collection('users')
        .orderBy('name')
        .limit(100)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => UserModel.fromJson(doc.data()))
            .toList());
    return response;
  }
}
