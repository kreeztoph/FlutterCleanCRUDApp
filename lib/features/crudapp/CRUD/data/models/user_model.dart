import 'package:firebasecrud/features/crudapp/CRUD/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required String? id,
    required String? name,
    required int? age,
  }) : super(
          id: id,
          age: age,
          name: name,
        );

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      age: data['age'],
      name: data['name'],
    );
  }
  Map<String, dynamic> toJson() {
    // ignore: prefer_typing_uninitialized_variables
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }
}
