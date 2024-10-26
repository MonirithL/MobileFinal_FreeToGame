import 'package:flutter/cupertino.dart';

class BottomNavLogic extends ChangeNotifier{
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;


  void goIndex(int index){
    _currentIndex = index;
    notifyListeners();
  }

}