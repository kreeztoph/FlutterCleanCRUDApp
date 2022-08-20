import 'package:flutter/material.dart';

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
