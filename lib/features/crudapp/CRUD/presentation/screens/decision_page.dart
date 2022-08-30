// ignore_for_file: prefer_const_constructors
import 'package:firebasecrud/features/crudapp/CRUD/presentation/screens/create_user_page.dart';
import 'package:firebasecrud/features/crudapp/CRUD/presentation/screens/delete_users_screen.dart';
import 'package:firebasecrud/features/crudapp/CRUD/presentation/screens/edit_user_page.dart';
import 'package:firebasecrud/features/crudapp/CRUD/presentation/screens/list_users_page.dart';
import 'package:firebasecrud/features/crudapp/CRUD/presentation/widgets/grid_view.dart';
import 'package:flutter/material.dart';

class DecisionPage extends StatelessWidget {
  const DecisionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('CRUD App'),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Pick an action',
                  style: TextStyle(fontSize: 36),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          HomeGridView(
                            color: Colors.red,
                            action: 'Delete',
                            page: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DeleteUserListPage()));
                            },
                          ),
                          HomeGridView(
                            color: Colors.blue,
                            action: 'Add ',
                            page: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CreateUserPage()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          HomeGridView(
                            color: Colors.amber,
                            action: 'Edit',
                            page: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => EditUserPage()));
                            },
                          ),
                          HomeGridView(
                            color: Colors.green,
                            action: 'Read',
                            page: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => FetchUsersPage()));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
