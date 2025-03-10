import 'package:firebase_auth/firebase_auth.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class AuthenticatedUser extends HomeState {
  final User user;
  AuthenticatedUser(this.user);
}

class HomeError extends HomeState {
  final String error;
  HomeError(this.error);
}
