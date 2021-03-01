import 'package:flutter/foundation.dart';

class ThemeController extends ChangeNotifier {
  bool _isDark = true;
  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = _isDark ? false : true;
    notifyListeners();
  }
}
