import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _sharedPrefs;

  Future<SharedPreferences> init() async =>
      _sharedPrefs = await SharedPreferences.getInstance();

  String get(final String key) => _sharedPrefs.getString(key) ?? '';
  bool getBool(final String key) => _sharedPrefs.getBool(key) ?? false;

  Future<void> set(final String key, final String value) async {
    await _sharedPrefs.setString(key, value);
  }

  bool has(final String key) => _sharedPrefs.containsKey(key);

  Future<void> remove(final String key) async => _sharedPrefs.remove(key);

  Future<void> clear() async => _sharedPrefs.clear();
}

final sharedPrefs = SharedPrefs();
