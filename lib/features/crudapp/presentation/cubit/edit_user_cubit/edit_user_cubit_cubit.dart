import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edit_user_cubit_state.dart';

class EditUserCubit extends Cubit<EditUserCubitState> {
  EditUserCubit() : super(EditUserCubitInitial());
}
