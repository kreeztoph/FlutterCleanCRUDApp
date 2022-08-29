// ignore_for_file: prefer_const_constructors

import 'package:firebasecrud/features/crudapp/presentation/widgets/grid_view.dart';
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
                              Navigator.pushNamed(context, '/delete');
                            },
                          ),
                          HomeGridView(
                            color: Colors.blue,
                            action: 'Add ',
                            page: () {
                              Navigator.pushNamed(context, '/create');
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
                              Navigator.pushNamed(context, '/edit');
                            },
                          ),
                          HomeGridView(
                            color: Colors.green,
                            action: 'Read',
                            page: () {
                              Navigator.pushNamed(context, '/fetch');
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
