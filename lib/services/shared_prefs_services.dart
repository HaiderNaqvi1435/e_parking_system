import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static const String _firstTimeKey = 'first_time';

  static Future<bool> isFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_firstTimeKey) ?? true;
  }

  static Future<void> setFirstTime(bool isFirstTime) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_firstTimeKey, isFirstTime);
  }
}
