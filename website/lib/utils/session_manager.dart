class SessionManager {
  static final SessionManager _instance = SessionManager._internal();

  factory SessionManager() => _instance;

  // UserEntity? user;

  SessionManager._internal() {
    // init things inside this
  }
}
