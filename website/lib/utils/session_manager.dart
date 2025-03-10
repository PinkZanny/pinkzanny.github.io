import 'package:firebase_auth/firebase_auth.dart';

class SessionManager {
  static final SessionManager _instance = SessionManager._internal();

  factory SessionManager() => _instance;

  User? user;

  SessionManager._internal() {
    // init things inside this
  }
}
