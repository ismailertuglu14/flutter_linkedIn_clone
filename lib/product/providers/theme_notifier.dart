import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier with ChangeNotifier {
  final String key = 'theme';
  SharedPreferences? _prefs;
  late bool _darkTheme;
  bool get dark => _darkTheme;

  ThemeNotifier() {
    _darkTheme = false;
    _loadfromPrefs();
  }
  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  _loadfromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs!.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs!.setBool(key, _darkTheme);
  }
}
