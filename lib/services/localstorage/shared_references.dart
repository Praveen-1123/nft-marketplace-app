import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences _prefs;

Future<String> readPrefs(String key) async {
  _prefs = await SharedPreferences.getInstance();
  return _prefs.getString(key);
}

Future writePrefs(String key, String data) async {
  _prefs = await SharedPreferences.getInstance();
  return _prefs.setString(key, data);
}

Future writePrefsBool(String key, bool data) async {
  _prefs = await SharedPreferences.getInstance();
  return _prefs.setBool(key, data);
}
