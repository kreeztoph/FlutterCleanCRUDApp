// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebasecrud/core/error/exception.dart';
import 'package:firebasecrud/core/error/failure.dart';
import 'package:firebasecrud/features/crudapp/data/models/user_model.dart';
import 'package:firebasecrud/features/crudapp/presentation/cubit/create_user_cubit/user_cubit.dart';
import 'package:firebasecrud/features/crudapp/presentation/widgets/loading_circle.dart';
import 'package:firebasecrud/features/crudapp/presentation/widgets/loading_circle_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebasecrud/injection_container.dart';

class CreateUserPage extends StatelessWidget {
  CreateUserPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Create a new user'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: buildBody(),
        ),
      ),
    );
  }
}

BlocProvider<UserCubit> buildBody() {
  return BlocProvider(
    create: (_) => sl<UserCubit>(),
    child: Center(
        child: BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('User Created Successfully'),
            ),
          );
        } else if (state is Error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Unable to create user'),
            ),
          );
        }
      },
      child: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
        if (state is UserInitial) {
          return UserControl();
        } else if (state is UserLoading) {
          return LoadingCircle2();
        } else {
          return UserControl();
        }
      }),
    )),
  );
}

class UserControl extends StatefulWidget {
  const UserControl({Key? key}) : super(key: key);

  @override
  State<UserControl> createState() => _UserControlState();
}

class _UserControlState extends State<UserControl> {
  String? nameInput;
  int? ageInput;
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: screensize.height / 40,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Create a User',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: screensize.height / 20,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: 'Name',
            ),
            onChanged: ((value) {
              nameInput = value;
            }),
          ),
          SizedBox(
            height: screensize.height / 40,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: 'Age',
            ),
            onChanged: ((value1) {
              ageInput = int.parse(value1);
            }),
          ),
          SizedBox(
            height: screensize.height / 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () => _create(context),
                  child: const Text('Create Data'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _create(BuildContext context) {
    controller.clear();
    BlocProvider.of<UserCubit>(context)
        .createUserFront(UserModel(name: nameInput, age: ageInput, id: ''));
  }
}
