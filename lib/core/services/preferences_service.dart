import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const _themeKey = 'theme_mode';

  final SharedPreferences _prefs;

  PreferencesService(this._prefs);

  static Future<PreferencesService> create() async {
    final prefs = await SharedPreferences.getInstance();
    return PreferencesService(prefs);
  }

  bool get isDarkMode => _prefs.getBool(_themeKey) ?? false;

  Future<void> setDarkMode(bool value) => _prefs.setBool(_themeKey, value);
}
