import 'package:firebasecrud/features/crudapp/presentation/screens/create_user_page.dart';
import 'package:firebasecrud/features/crudapp/presentation/screens/decision_page.dart';
import 'package:firebasecrud/features/crudapp/presentation/screens/list_users_page.dart';
import 'package:flutter/material.dart';

class PagingRoutes extends StatelessWidget {
  const PagingRoutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) {
          return DecisionPage();
        },
        '/create': (context) {
          return CreateUserPage();
        },
        '/fetch': (context) {
          return FetchUsersPage();
        }
      },
    );
  }
}
