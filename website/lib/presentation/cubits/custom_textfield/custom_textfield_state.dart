part of 'custom_textfield_cubit.dart';

@immutable
sealed class CustomTextfieldState {}

// ignore: must_be_immutable
class CustomTextfieldInitial extends CustomTextfieldState {
  bool isVisible = false;

  CustomTextfieldInitial({this.isVisible = false});
}

final class CustomTextfieldError extends CustomTextfieldState {
  bool isVisible = false;
  final String message;

  CustomTextfieldError(this.message, {this.isVisible = false});
}

final class CustomTextfieldSuccess extends CustomTextfieldState {}
