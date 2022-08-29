import 'package:firebasecrud/features/crudapp/data/models/user_model.dart';
import 'package:firebasecrud/features/crudapp/presentation/cubit/edit_user_cubit/edit_user_cubit_cubit.dart';
import 'package:firebasecrud/features/crudapp/presentation/widgets/loading_circle_2.dart';
import 'package:firebasecrud/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPageDetails extends StatelessWidget {
  final UserModel user;
  const EditPageDetails({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? nameInput = '${user.name}';
    int? ageInput = user.age;
    String usermodelid = '${user.id}';
    final screensize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Edit User details'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: screensize.height / 40,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Edit ${user.name}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: screensize.height / 20,
              ),
              TextField(
                controller: TextEditingController(text: nameInput),
                onChanged: ((value) {
                  if (value.isEmpty) {
                    nameInput = '${user.name}';
                  } else {
                    nameInput = value;
                  }
                }),
              ),
              SizedBox(
                height: screensize.height / 40,
              ),
              TextField(
                controller: TextEditingController(text: '$ageInput'),
                onChanged: ((value1) {
                  if (value1.isEmpty) {
                    ageInput = int.parse('${user.age}');
                  } else {
                    ageInput = int.parse(value1);
                  }
                }),
              ),
              SizedBox(
                height: screensize.height / 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {},
                      child: const Text('Edit Data'),
                    ),
                  ),
                ],
              )
            ],
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
//         child: BlocListener<EditUserCubit, EditUserCubitState>(
//       listener: (context, state) {
//         if (state is EditUserCubitLoaded) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('User Edited Successfully'),
//             ),
//           );
//         } else if (state is Error) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('Unable to edit user'),
//             ),
//           );
//         }
//       },
//       child: BlocBuilder<EditUserCubit, EditUserCubitState>(
//           builder: (context, state) {
//         if (state is EditUserCubitInitial) {
//           return UserControl();
//         } else if (state is EditUserCubitLoading) {
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
//   String? nameInput = '${user.name}';
//   int? ageInput = user.age;
//   String usermodelid = '${user.id}';
//   final controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     final screensize = MediaQuery.of(context).size;

//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             SizedBox(
//               height: screensize.height / 40,
//             ),
//             const Align(
//               alignment: Alignment.center,
//               child: Text(
//                 'Edit a User',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ),
//             SizedBox(
//               height: screensize.height / 20,
//             ),
//             TextField(
//               controller: TextEditingController(text: nameInput),
//               onChanged: ((value) {
//                 if (value.isEmpty) {
//                   nameInput = '${user.name}';
//                 } else {
//                   nameInput = value;
//                 }
//               }),
//             ),
//             SizedBox(
//               height: screensize.height / 40,
//             ),
//             TextField(
//               controller: TextEditingController(text: '$ageInput'),
//               onChanged: ((value1) {
//                 if (value1.isEmpty) {
//                   ageInput = int.parse('${user.age}');
//                 } else {
//                   ageInput = int.parse(value1);
//                 }
//               }),
//             ),
//             SizedBox(
//               height: screensize.height / 40,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15))),
//                     onPressed: () => _edit(context),
//                     child: const Text('Edit Data'),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       );
//     }

//     void _edit(BuildContext context) {
//       controller.clear();
//       BlocProvider.of<EditUserCubit>(context)
//           .editUsers(UserModel(name: nameInput, age: ageInput, id: usermodelid));
//     }
//   }
// }
