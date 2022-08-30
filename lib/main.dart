// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors
import 'package:firebasecrud/features/crudapp/CRUD/presentation/screens/create_user_page.dart';
import 'package:firebasecrud/features/crudapp/CRUD/presentation/screens/decision_page.dart';
import 'package:firebasecrud/features/crudapp/CRUD/presentation/screens/delete_users_screen.dart';
import 'package:firebasecrud/features/crudapp/CRUD/presentation/screens/edit_user_page.dart';
import 'package:firebasecrud/features/crudapp/CRUD/presentation/screens/list_users_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'injection_container.dart' as di;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUD App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) {
          return DecisionPage();
        },
        '/create': (context) {
          return CreateUserPage();
        },
        '/edit': (context) {
          return EditUserPage();
        },
        '/fetch': (context) {
          return FetchUsersPage();
        },
        '/delete': (context) {
          return DeleteUserListPage();
        }
      },

      // home: DeleteUserListPage(),
    );
  }
}
