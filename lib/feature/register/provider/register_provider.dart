import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterProvider with ChangeNotifier {
  /* */
  int _page = 0;
  int get page => _page;
  set page(int value) {
    _page = value;
    notifyListeners();
  }
  /* */
}
