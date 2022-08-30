// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class HomeGridView extends StatefulWidget {
  final Color color;
  final String action;
  final Function() page;

  HomeGridView(
      {Key? key, required this.color, required this.action, required this.page})
      : super(key: key);

  @override
  State<HomeGridView> createState() => _HomeGridViewState();
}

class _HomeGridViewState extends State<HomeGridView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.color,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: widget.page,
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.width / 2.2,
          child: Center(
              child: Text(
            widget.action,
            style: TextStyle(fontSize: 24),
          )),
        ),
      ),
    );
  }
}
