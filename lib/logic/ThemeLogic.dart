import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ThemeLogic extends ChangeNotifier {
  int _themeIndex = 1;
  int get themeIndex => _themeIndex;

  //1 is light and zero is dark

  final _cache = FlutterSecureStorage();
  final _key = "ThemeLogic";

  Future readCache() async{
    String? value = await _cache.read(key: _key);
    _themeIndex = int.parse(value ?? '0');
    notifyListeners();
  }

  void toggle() {
    if (_themeIndex == 0) {
      _themeIndex = 1;
    } else {
      _themeIndex = 0;
    }
    _cache.write(key: _key, value: _themeIndex.toString());
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
