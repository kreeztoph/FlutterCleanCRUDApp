import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasecrud/features/crudapp/authentication/data/models/email_password_model.dart';
import 'package:firebasecrud/features/crudapp/authentication/domain/entities/emailPassword.dart';

abstract class AuthRemoteDataSource {
  Future<void> postCreateUser(EmailPasswordModel params);
  Future<User> postLoginUser(EmailPassword params);
  Future<User> postRegisterUser(EmailPassword params);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl(
      {required this.firebaseFirestore, required this.firebaseAuth});

  @override
  Future<void> postCreateUser(EmailPasswordModel params) {
    final response = firebaseAuth.createUserWithEmailAndPassword(
        email: params.email, password: params.email);
    return response;
  }

  @override
  Future<User> postLoginUser(EmailPassword params) {
    // TODO: implement postLoginUser
    throw UnimplementedError();
  }

  @override
  Future<User> postRegisterUser(EmailPassword params) {
    // TODO: implement postRegisterUser
    throw UnimplementedError();
  }
}
