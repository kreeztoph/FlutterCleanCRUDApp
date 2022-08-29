// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:firebasecrud/features/crudapp/data/models/user_model.dart';
import 'package:firebasecrud/features/crudapp/presentation/cubit/edit_user_cubit/edit_user_cubit_cubit.dart';
import 'package:firebasecrud/features/crudapp/presentation/screens/edit_page_details.dart';
import 'package:firebasecrud/features/crudapp/presentation/screens/list_users_page.dart';
import 'package:firebasecrud/features/crudapp/presentation/widgets/loading_circle.dart';
import 'package:firebasecrud/features/crudapp/presentation/widgets/loading_circle_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebasecrud/injection_container.dart';

class EditUserPage extends StatelessWidget {
  EditUserPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Edit a user'),
          centerTitle: true,
        ),
        body: buildbody(),
      ),
    );
  }
}

BlocProvider<EditUserCubit> buildbody() {
  return BlocProvider(
    create: (_) => sl<EditUserCubit>(),
    child: Center(child: BlocBuilder<EditUserCubit, EditUserCubitState>(
        builder: (context, state) {
      if (state is EditUserCubitInitial) {
        return EditUserControls();
      } else if (state is EditUserCubitLoading) {
        return LoadingCircle2();
      }
      if (state is EditUserCubitLoaded) {
        final users = state.users;
        return StreamBuilder<List<UserModel>>(
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return (Text('Something went wrong'));
            } else if (snapshot.hasData) {
              final user = snapshot.data!;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text('Name is ${user[index].name}'),
                          subtitle: Text('Age is ${user[index].age}'),
                          trailing: IconButton(
                            icon: Icon(Icons.edit_outlined),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => EditPageDetails(
                                    user: UserModel(
                                        name: '${user[index].name}',
                                        age: user[index].age,
                                        id: '${user[index].id}'),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: user.length,
              );
            } else {
              return LoadingCircle();
            }
          },
          stream: users,
        );
      } else {
        return Center();
      }
    })),
  );
}

class EditUserControls extends StatefulWidget {
  const EditUserControls({Key? key}) : super(key: key);

  @override
  State<EditUserControls> createState() => _EditUserControlsState();
}

class _EditUserControlsState extends State<EditUserControls> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<EditUserCubit>(context).fetchUsersForEdit();
    print('We here');
    return Center();
  }
}
