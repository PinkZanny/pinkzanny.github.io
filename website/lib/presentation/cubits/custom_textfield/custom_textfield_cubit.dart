import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'custom_textfield_state.dart';

class CustomTextfieldCubit extends Cubit<CustomTextfieldState> {
  CustomTextfieldCubit() : super(CustomTextfieldInitial());

  void realtimeValidation(String value, bool isPassword) {
    RegExp regularExpression = isPassword
        ? RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
        : RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!isPassword) {
      if (value.length >= 3) {
        if (regularExpression.hasMatch(value)) {
          emit(CustomTextfieldSuccess());
        } else {
          emit(
            CustomTextfieldError(
              'Invalid Email',
            ),
          );
        }
      } else {
        emit(CustomTextfieldInitial());
      }
    } else {
      if (value.length >= 8) {
        if (regularExpression.hasMatch(value)) {
          emit(CustomTextfieldSuccess());
        } else {
          emit(
            CustomTextfieldError(
              'Password should be at least 8 characters long and contain at least one uppercase letter, one lowercase letter and one number',
            ),
          );
        }
      } else {
        emit(CustomTextfieldInitial());
      }
    }
  }

  void toggleVisibility() {
    if (state is CustomTextfieldInitial) {
      final currentState = state as CustomTextfieldInitial;
      emit(CustomTextfieldInitial(isVisible: !currentState.isVisible));
    } else if (state is CustomTextfieldError) {
      final currentState = state as CustomTextfieldError;
      emit(CustomTextfieldError(
        currentState.message,
        isVisible: !currentState.isVisible,
      ));
    } else if (state is CustomTextfieldSuccess) {
      emit(CustomTextfieldInitial(isVisible: true));
    }
  }
}
