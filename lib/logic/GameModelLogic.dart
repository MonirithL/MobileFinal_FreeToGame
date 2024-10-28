import 'package:flutter/foundation.dart';
import 'package:freetogame/model/GameModel.dart';
import 'package:freetogame/service/GameService.dart';

class GameModelLogic extends ChangeNotifier{
  List<GameModel> _games = [];
  List<GameModel> get games => _games;

  List<GameModel> _searchGames=[];
  List<GameModel> get searchGames => searchGames;

  String _query = "";

  bool _loading = false;
  bool get loading => _loading;

  String? _error;
  String? get error => _error;

  void setLoading(){
    _loading = true;
    notifyListeners();
  }
  void disableLoading(){
    _loading = false;
    notifyListeners();
  }
  Future read() async {
    setLoading();

    try {
      _games = await GameService.getModels();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
    }
    notifyListeners();
  }

  void searchObjects(String query) async {
    if(query.trim().isEmpty){
      List<GameModel> gamesSearched = [];
      _searchGames = gamesSearched;
    }else if(query.trim()==_query){

    }else{
      List<GameModel> gamesSearched = [];
      gamesSearched.addAll(_games.where((game) {
        return game.title.toLowerCase().contains(query.trim().toLowerCase());
      }
      )
      );
      _searchGames = gamesSearched;
    }
  }



}