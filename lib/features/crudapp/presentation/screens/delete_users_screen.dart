import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasecrud/features/crudapp/data/models/user_model.dart';
import 'package:firebasecrud/features/crudapp/domain/usecases/list_users_paginated..dart';
import 'package:firebasecrud/features/crudapp/presentation/cubit/fetch_users_cubit/fetch_users_cubit.dart';
import 'package:firebasecrud/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/firestore.dart';

class DeleteUserListPage extends StatefulWidget {
  const DeleteUserListPage({Key? key}) : super(key: key);

  @override
  State<DeleteUserListPage> createState() => _DeleteUserListPageState();
}

class _DeleteUserListPageState extends State<DeleteUserListPage> {
// final ListUserPaginated querypost;
  final querypost = FirebaseFirestore.instance
      .collection('users')
      .orderBy('name')
      .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Delete a User'),
              centerTitle: true,
            ),
            body: BlocProvider(
              create: (_) => sl<FetchUsersCubit>(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FirestoreListView<UserModel>(
                  query: querypost,
                  pageSize: 8,
                  itemBuilder: (context, snapshot) {
                    final user = snapshot.data();
                    return InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text("Are you sure you want to delete?"),
                            content: Text(
                                'You are about to delete ${user.name} from the database'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  BlocProvider.of<FetchUsersCubit>(context)
                                      .deleteUserListPage(user.id as String);
                                  Navigator.of(ctx).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('user delete Successful'),
                                    ),
                                  );
                                },
                                child: Text('Yes'),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('user delete cancelled'),
                                      ),
                                    );
                                  },
                                  child: Text('No')),
                            ],
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text('Name is ${user.name}'),
                            subtitle: Text('Age is ${user.age}'),
                            trailing: IconButton(
                              icon: Icon(Icons.delete_outline),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: Text(
                                        "Are you sure you want to delete?"),
                                    content: Text(
                                        'You are about to delete ${user.name} from the database'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          BlocProvider.of<FetchUsersCubit>(
                                                  context)
                                              .deleteUserListPage(
                                                  user.id as String);
                                          Navigator.of(ctx).pop();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'user delete Successful'),
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
                                                content: Text(
                                                    'user delete cancelled'),
                                              ),
                                            );
                                          },
                                          child: Text('No')),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )));
  }
}
