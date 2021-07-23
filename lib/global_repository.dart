import 'package:shared_preferences/shared_preferences.dart';

class GlobalRepository {
  static final GlobalRepository _instance = GlobalRepository._();

  static SharedPreferences? _prefs;

  SharedPreferences? get pref => _prefs;

  factory GlobalRepository() => _instance;

  GlobalRepository._() {
    if (_prefs == null) {
      setPrefs();
    }
  }

  static Future<void> setPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
