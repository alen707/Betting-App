import 'package:flutter/material.dart';

class MatchProvider with ChangeNotifier{
  
   final List<Map<String, dynamic>> _scoreBoardData = [
    {
      "homeTeamName": "Chelsea",
      "homeTeamLogo": "assets/images/Chelsea_FC.png",
      "awayTeamName": "Leicester C",
      "awayTeamLogo": "assets/images/Leicester_City_crest.png",
      "leagueName": "Premier League",
      "matchTime": "49:30",
      "score": "1:2",
      "homeOdd": "1.8",
      "drawOdd": "2.1",
      "awayOdd": "1.3",
    },
    {
      "homeTeamName": "Arsenal",
      "homeTeamLogo": "assets/images/Arsenal_FC.png",
      "awayTeamName": "Roma",
      "awayTeamLogo": "assets/images/roma.png",
      "leagueName": "UEFA Europa League",
      "matchTime": "12:42",
      "score": "0:1",
      "homeOdd": "1.9",
      "drawOdd": "2.0",
      "awayOdd": "1.5",
    },
   
   ];
    List<Map<String, dynamic>> get scoreBoardData => _scoreBoardData;

    void addMatch(Map<String,dynamic> newMatch){
      _scoreBoardData.add(newMatch);
      notifyListeners();
    }

}