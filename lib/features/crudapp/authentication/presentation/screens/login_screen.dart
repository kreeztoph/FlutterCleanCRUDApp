// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:firebasecrud/features/crudapp/CRUD/presentation/screens/decision_page.dart';
import 'package:firebasecrud/features/crudapp/CRUD/presentation/widgets/loading_circle_2.dart';
import 'package:firebasecrud/features/crudapp/authentication/domain/entities/emailPassword.dart';
import 'package:firebasecrud/features/crudapp/authentication/presentation/cubit/Log_in_cubit/login_cubit.dart';
import 'package:firebasecrud/features/crudapp/authentication/presentation/screens/signup_screen.dart';
import 'package:firebasecrud/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text('User Login')),
      body: buildSignUpBody(),
    ));
  }
}

BlocProvider<LoginCubit> buildSignUpBody() {
  return BlocProvider(
    create: (_) => sl<LoginCubit>(),
    child: BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoaded) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: ((context) => DecisionPage())));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Logged in Successfully'),
            ),
          );
        } else if (state is Error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Unable to log in'),
            ),
          );
        }
      },
      child: BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
        if (state is LoginInitial) {
          return RegisterUserControl();
        } else if (state is LoginLoading) {
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
                    onPressed: () => _loginUser(context),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      minimumSize: Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Log  In',
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
                      Text("Don't have an account?"),
                      VerticalDivider(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                        },
                        child: Text(
                          "Register Now",
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

  void _loginUser(BuildContext context) {
    BlocProvider.of<LoginCubit>(context).logInUser(
      EmailPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()),
    );
  }
}
