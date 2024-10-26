import 'package:flutter/material.dart';
import 'package:freetogame/language/Language.dart';

class LanguageLogic extends ChangeNotifier{
  int _langIndex = 0;
  int get langIndex =>_langIndex;

  Language _lang = Khmer();
  Language get lang => _lang;

  void toggle() {
    if (_langIndex == 1) {
      _langIndex = 0;
    } else {
      _langIndex = 1;
    }
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