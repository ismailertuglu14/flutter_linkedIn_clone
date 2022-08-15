import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final String key = 'isLogged';

  SharedPreferences? _prefs;
  late bool _isLogged;
  bool get isLogged => _isLogged;

  AuthProvider() {
    _isLogged = false;
    _loadfromPrefs();
  }
  login() {
    _isLogged = true;
    _saveToPrefs();
    notifyListeners();
  }

  logout() {
    _isLogged = false;
    _saveToPrefs();

    notifyListeners();
  }

  _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  _loadfromPrefs() async {
    await _initPrefs();
    _isLogged = _prefs!.getBool(key) ?? false;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs!.setBool(key, _isLogged);
  }
}
