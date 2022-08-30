import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasecrud/features/crudapp/CRUD/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<void> createUser(UserModel params);
  Future<void> deleteUser(String name);
  Future<void> editUser(UserModel params);
  Stream<List<UserModel>> listUser();
  CollectionReference<UserModel> listUserPaginated();
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
        .doc(params.id)
        .update(params.toJson());
    return response;
  }

  @override
  Stream<List<UserModel>> listUser() {
    final response = firebaseFirestore
        .collection('users')
        .orderBy('name')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => UserModel.fromJson(doc.data()))
            .toList());
    return response;
  }

  @override
  CollectionReference<UserModel> listUserPaginated() {
    final querypost = FirebaseFirestore.instance
        .collection('users')
        .withConverter<UserModel>(
            fromFirestore: (snapshot, _) =>
                UserModel.fromJson(snapshot.data()!),
            toFirestore: (user, _) => user.toJson());
    return querypost;
  }
}
