// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebasecrud/core/error/exception.dart';
import 'package:firebasecrud/core/error/failure.dart';
import 'package:firebasecrud/features/crudapp/data/models/user_model.dart';
import 'package:firebasecrud/features/crudapp/presentation/cubit/create_user_cubit/user_cubit.dart';
import 'package:firebasecrud/features/crudapp/presentation/cubit/edit_user_cubit/edit_user_cubit_cubit.dart';
import 'package:firebasecrud/features/crudapp/presentation/widgets/loading_circle_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebasecrud/injection_container.dart';

class EditUserPage extends StatelessWidget {
  EditUserPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Edit a user'),
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

// BlocProvider<EditUserCubit> buildBody() {
//   return BlocProvider(
//     create: (_) => sl<EditUserCubit>(),
//     child: Center(
//         child: BlocListener<UserCubit, UserState>(
//       listener: (context, state) {
//         if (state is UserLoaded) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('User Edited Successfully'),
//             ),
//           );
//         } else if (state is Error) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('Unable to Edit user'),
//             ),
//           );
//         }
//       },
//       child: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
//         if (state is UserInitial) {
//           return UserControl();
//         } else if (state is UserLoading) {
//           return LoadingCircle2();
//         } else {
//           return UserControl();
//         }
//       }),
//     )),
//   );
// }

// class UserControl extends StatefulWidget {
//   const UserControl({Key? key}) : super(key: key);

//   @override
//   State<UserControl> createState() => _UserControlState();
// }

// class _UserControlState extends State<UserControl> {
//   String? nameInput;
//   int? ageInput;
//   final controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     final screensize = MediaQuery.of(context).size;
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           SizedBox(
//             height: screensize.height / 40,
//           ),
//           const Align(
//             alignment: Alignment.center,
//             child: Text(
//               'Edit a User',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ),
//           SizedBox(
//             height: screensize.height / 20,
//           ),
//           TextField(
//             decoration: InputDecoration(
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               hintText: 'Find a user by name',
//             ),
//             onChanged: ((value) {
//               nameInput = value;
//             }),
//           ),
//           SizedBox(
//             height: screensize.height / 40,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15))),
//                   onPressed: () {},
//                   child: const Text('Find Users'),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
