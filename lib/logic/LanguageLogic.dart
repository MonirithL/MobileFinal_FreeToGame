import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freetogame/language/Language.dart';

class LanguageLogic extends ChangeNotifier{
  int _langIndex = 0;
  int get langIndex =>_langIndex;

  Language _lang = Khmer();
  Language get lang => _lang;

  final _cache = FlutterSecureStorage();
  final _key = "LangLogic";

  Future readCache() async{
    String? value = await _cache.read(key: _key);
    _langIndex = int.parse(value ?? '0');
    notifyListeners();
  }

  void toggle() {
    if (_langIndex == 1) {
      _langIndex = 0;
    } else {
      _langIndex = 1;
    }
    _cache.write(key: _key, value: _langIndex.toString());
    notifyListeners();
  }
  
 void changeToEnglish(){
    _langIndex = 0;
    _lang = langList[_langIndex];
    notifyListeners();
  }
  void changeToKhmer(){
    _langIndex = 1;
    _lang = langList[_langIndex];
    notifyListeners();
  }

 
}