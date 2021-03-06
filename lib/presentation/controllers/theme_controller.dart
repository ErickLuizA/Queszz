import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const DARK = 'DARK';

class ThemeController extends ChangeNotifier {
  static ThemeController instance;

  SharedPreferences _sharedPreferences;

  bool _isDark;
  bool get isDark => _isDark;

  Future<void> load() async {
    _sharedPreferences = await SharedPreferences.getInstance();

    bool storageTheme = _sharedPreferences.getBool(DARK) == null ? false : true;

    _isDark = storageTheme;

    notifyListeners();
  }

  void toggleTheme() {
    _sharedPreferences.setBool(DARK, _isDark ? false : true);
    _isDark = _isDark ? false : true;

    notifyListeners();
  }
}
