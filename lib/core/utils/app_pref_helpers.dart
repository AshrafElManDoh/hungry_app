import 'package:shared_preferences/shared_preferences.dart';

abstract class AppPrefHelpers {
  static const String tokenKey = "token";
  static const String guestModeKey = "guestmode";
  static const String usernameKey = "username";
  static const String emailKey = "email";

  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveData(String key, value) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    }
  }

  static dynamic loadData(String key) {
    return _prefs.get(key);
  }

  static clearData() async {
    await _prefs.clear();
  }
}
