// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebasecrud/core/error/exception.dart';
import 'package:firebasecrud/core/error/failure.dart';
import 'package:firebasecrud/features/crudapp/data/models/user_model.dart';
import 'package:firebasecrud/features/crudapp/presentation/cubit/create_user_cubit/user_cubit.dart';
import 'package:firebasecrud/features/crudapp/presentation/cubit/edit_user_cubit/edit_user_cubit_cubit.dart';
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
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hello there'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

BlocProvider<EditUserCubit> buildbody() {
  return BlocProvider(
      create: (_) => sl<EditUserCubit>(),
      child: Center(
        child: BlocBuilder<EditUserCubit, EditUserCubitState>(
            builder: ((context, state) {
          if (state is EditUserCubitInitial) {
            return LoadingCircle2();
          } else if (state is EditUserCubitLoading) {
            return LoadingCircle();
          }
          if (state is EditUserCubitLoaded) {
            final users = state.users;
            return StreamBuilder<List<UserModel>>(builder: (context, snapshot) {
              if (snapshot.hasError) {
                return (Text('Something went wrong'));
              } else if (snapshot.hasData) {
                final user = snapshot.data!;
                return ListView.builder(itemBuilder: itemBuilder);
              } else {
                return LoadingCircle();
              }
            });
          } else {
            return Center();
          }
        })),
      ));
}

class EditUserControls extends StatefulWidget {
  const EditUserControls({Key? key}) : super(key: key);

  @override
  State<EditUserControls> createState() => _EditUserControlsState();
}

class _EditUserControlsState extends State<EditUserControls> {
  @override
  Widget build(BuildContext context) {}
}
