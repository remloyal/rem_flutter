import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static Future<void> setString(key, value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
  }

  static Future<String?> getString(key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }
}
