import 'package:firebasecrud/features/crudapp/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required String name,
    required int age,
  }) : super(
          age: age,
          name: name,
        );

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      age: data['age'],
      name: data['name'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }
}
