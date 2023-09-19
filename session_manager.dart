import 'package:cheap_fit/domain/entities/balance_entity.dart';
import 'package:cheap_fit/domain/entities/user_entity.dart';

class SessionManager {
  static final SessionManager _instance = SessionManager._internal();

  factory SessionManager() => _instance;

  UserEntity? user;
  BalanceEntity? balance;
  bool? hasHealthPermission;
  Map<String, dynamic>? hasHealth;
  (int, bool)? hasReceivedToday;

  SessionManager._internal() {
    // init things inside this
  }
}
