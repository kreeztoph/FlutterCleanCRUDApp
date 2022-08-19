import 'package:flutter/material.dart';

class LoadingCircle2 extends StatelessWidget {
  const LoadingCircle2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: CircularProgressIndicator(color: Colors.blue.shade600),
      ),
    );
  }
}
