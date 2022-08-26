// ignore_for_file: prefer_const_constructors

import 'package:firebasecrud/features/crudapp/data/models/user_model.dart';
import 'package:firebasecrud/features/crudapp/presentation/cubit/edit_user_cubit/edit_user_cubit_cubit.dart';
import 'package:firebasecrud/features/crudapp/presentation/cubit/fetch_users_cubit/fetch_users_cubit.dart';
import 'package:firebasecrud/features/crudapp/presentation/widgets/loading_circle.dart';
import 'package:firebasecrud/features/crudapp/presentation/widgets/loading_circle_2.dart';
import 'package:firebasecrud/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchUsersPage extends StatefulWidget {
  const FetchUsersPage({Key? key}) : super(key: key);

  @override
  State<FetchUsersPage> createState() => _FetchUsersPageState();
}

class _FetchUsersPageState extends State<FetchUsersPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('List all users'),
          centerTitle: true,
        ),
        // body: Container(
        //   child: Center(
        //     child: ListView.builder(
        //       itemCount: 8,
        //       itemBuilder: ((context, index) => Card(
        //             child: ListTile(
        //               title: Text('Username $index'),
        //               subtitle: Text('Email $index'),
        //               trailing: Icon(Icons.arrow_forward),
        //             ),
        //           )),
        //     ),
        //   ),
        // ),
        body: bodybuild(),
      ),
    );
  }
}

BlocProvider<FetchUsersCubit> bodybuild() {
  return BlocProvider(
    create: (_) => sl<FetchUsersCubit>(),
    child: Center(
      child: BlocBuilder<FetchUsersCubit, FetchUsersState>(
        builder: (context, state) {
          if (state is FetchUsersInitial) {
            return FetchUsersControl();
          } else if (state is FetchUsersLoading) {
            return LoadingCircle2();
          } else if (state is FetchUsersLoaded) {
            final users = state.users;

            return StreamBuilder<List<UserModel>>(
              builder: ((context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                } else if (snapshot.hasData) {
                  final user = snapshot.data!;
                  return ListView(children: user.map(buildUserList).toList());
                } else {
                  return LoadingCircle();
                }
              }),
              stream: users,
            );
          } else {
            return FetchUsersControl();
          }
        },
      ),
    ),
  );
}

class FetchUsersControl extends StatefulWidget {
  const FetchUsersControl({Key? key}) : super(key: key);

  @override
  State<FetchUsersControl> createState() => _FetchUsersControlState();
}

class _FetchUsersControlState extends State<FetchUsersControl> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FetchUsersCubit>(context).fetchUserFront();
    return Center();
  }
}

Widget buildUserList(UserModel userModel) => Builder(builder: (context) {
      String nameInput = '${userModel.name}';
      int? ageInput = userModel.age;
      String usermodelid = '${userModel.id}';
      final controllerName = TextEditingController();
      final controllerAge = TextEditingController();
      return Card(
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text('Name is ${userModel.name}'),
            subtitle: Text('Age is ${userModel.age}'),
            trailing: SizedBox(
              width: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (ctx) => Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: SimpleDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        titlePadding: EdgeInsets.all(16),
                                        title: Text(
                                            "Are you sure you want to edit, ${userModel.name}?"),
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: TextField(
                                              controller: TextEditingController(
                                                  text: nameInput),
                                              onChanged: ((value) {
                                                if (value.isEmpty) {
                                                  nameInput =
                                                      '${userModel.name}';
                                                } else {
                                                  nameInput = value;
                                                }
                                              }),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: TextField(
                                              controller: TextEditingController(
                                                  text: '$ageInput'),
                                              onChanged: ((value1) {
                                                if (value1.isEmpty ||
                                                    value1 == 'Null' ||
                                                    value1 == null) {
                                                  ageInput = int.parse(
                                                      '${userModel.age}');
                                                } else {
                                                  ageInput = int.parse(value1);
                                                }
                                              }),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: ElevatedButton(
                                                child: Text('Change Details'),
                                                onPressed: () {
                                                  BlocProvider.of<
                                                              FetchUsersCubit>(
                                                          context)
                                                      .editUserListPage(
                                                          UserModel(
                                                              id: usermodelid,
                                                              name: nameInput,
                                                              age: ageInput));
                                                  Navigator.of(context).pop();
                                                  print(
                                                      '--------------------------');
                                                  print(nameInput);
                                                  print(ageInput);
                                                }),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(Icons.close)),
                                        ],
                                      ),
                                    ));
                          },
                          icon: Icon(Icons.edit_outlined))),
                  Expanded(
                      child: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: Text("Are you sure you want to delete?"),
                                content: Text(
                                    'You are about to delete ${userModel.name} from the database'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      BlocProvider.of<FetchUsersCubit>(context)
                                          .deleteUserListPage(
                                              userModel.id as String);
                                      Navigator.of(ctx).pop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content:
                                              Text('user delete Successful'),
                                        ),
                                      );
                                    },
                                    child: Text('Yes'),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content:
                                                Text('user delete cancelled'),
                                          ),
                                        );
                                      },
                                      child: Text('No')),
                                ],
                              ),
                            );
                            print({userModel.id});
                          },
                          icon: Icon(Icons.delete_outline_outlined))),
                ],
              ),
            ),
          ),
        ),
      );
    });
