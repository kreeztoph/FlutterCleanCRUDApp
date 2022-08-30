// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasecrud/features/crudapp/authentication/data/models/email_password_model.dart';
import 'package:firebasecrud/features/crudapp/authentication/domain/entities/emailPassword.dart';

abstract class AuthRemoteDataSource {
  Future<void> postCreateUser(EmailPasswordModel params);
  Future<User?> postLoginUser(EmailPassword params);
  Future<User?> postRegisterUser(EmailPassword params);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl(
      {required this.firebaseFirestore, required this.firebaseAuth});

  @override
  Future<void> postCreateUser(EmailPasswordModel params) {
    final response = firebaseFirestore
        .collection('users')
        .add(params.toJson())
        .then((value) => value.update({'id': value.id}));

    return response;
  }

  @override
  Future<User?> postLoginUser(EmailPassword params) {
    final response = firebaseAuth
        .signInWithEmailAndPassword(
            email: params.email, password: params.password)
        .then((value) => value.user);
    return response;
  }

  @override
  Future<User?> postRegisterUser(EmailPassword params) {
    final response = firebaseAuth
        .createUserWithEmailAndPassword(
            email: params.email, password: params.password)
        .then((value) => value.user);
    return response;
  }
}
