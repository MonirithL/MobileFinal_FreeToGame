import 'package:flutter/foundation.dart';
import 'package:freetogame/model/GameModel.dart';
import 'package:http/http.dart' as http;

class GameService{
  static Future<List<GameModel>> getModels() async {
    String gameUrl = "https://www.freetogame.com/api/games";
    http.Response res = await http.get(Uri.parse(gameUrl));
    return compute(_convert, res.body);
  }
  static List<GameModel> _convert(String body){
    List<GameModel> games = gameModelFromJson(body);
    return games;
  }
}