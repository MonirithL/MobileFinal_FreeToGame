import 'package:flutter/material.dart';

class ThemeLogic extends ChangeNotifier {
  int _themeIndex = 1;
  int get themeIndex => _themeIndex;

  //1 is light and zero is dark

  void toggle() {
    if (_themeIndex == 0) {
      _themeIndex = 1;
    } else {
      _themeIndex = 0;
    }
    print(_themeIndex);
    notifyListeners();
  }

 
  void changeToDark() {
    _themeIndex = 0;
    notifyListeners();
  }

  void changeToLight() {
    _themeIndex = 1;
    notifyListeners();
  }
}
