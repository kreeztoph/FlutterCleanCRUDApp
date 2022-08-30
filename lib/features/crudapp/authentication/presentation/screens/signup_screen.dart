// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:firebasecrud/features/crudapp/CRUD/presentation/widgets/loading_circle_2.dart';
import 'package:firebasecrud/features/crudapp/authentication/domain/entities/emailPassword.dart';
import 'package:firebasecrud/features/crudapp/authentication/presentation/cubit/sign_up_cubit/signup_cubit.dart';
import 'package:firebasecrud/features/crudapp/authentication/presentation/screens/login_screen.dart';
import 'package:firebasecrud/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text('Register New User')),
      body: buildSignUpBody(),
    ));
  }
}

BlocProvider<SignupCubit> buildSignUpBody() {
  return BlocProvider(
    create: (_) => sl<SignupCubit>(),
    child: BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupLoaded) {
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
      child: BlocBuilder<SignupCubit, SignupState>(builder: (context, state) {
        if (state is SignupInitial) {
          return RegisterUserControl();
        } else if (state is SignupLoading) {
          return LoadingCircle2();
        } else {
          return RegisterUserControl();
        }
      }),
    ),
  );
}

class RegisterUserControl extends StatefulWidget {
  const RegisterUserControl({Key? key}) : super(key: key);

  @override
  State<RegisterUserControl> createState() => _RegisterUserControlState();
}

class _RegisterUserControlState extends State<RegisterUserControl> {
  bool _isobscure = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _screen = MediaQuery.of(context).size;

    return SafeArea(
      //Scaffold is used to occupy the whole page
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //email
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            'Email',
                            style: TextStyle(color: Colors.red),
                          ),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.red,
                          ),
                        ),
                        // onChanged: (value) {
                        //   emailController = value;
                        // },
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                  //password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      child: TextField(
                        controller: passwordController,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.lock_clock_outlined,
                            color: Colors.red,
                          ),
                          label: Text(
                            'Password',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        // onChanged: (value1) {
                        //   passwordController = value1;
                        // },
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  //login button
                  ElevatedButton(
                    onPressed: () => _registerUser(context),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      minimumSize: Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //text for dont have an account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already a member?"),
                      VerticalDivider(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LogInPage()));
                        },
                        child: Text(
                          "Go back to login",
                          style: TextStyle(
                            color: Colors.redAccent[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _registerUser(BuildContext context) {
    BlocProvider.of<SignupCubit>(context).signUpNewUser(
      EmailPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()),
    );
  }
}
