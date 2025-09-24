import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class MatchProvider with ChangeNotifier {
  List<Map<String, dynamic>> _scoreBoardData = [
    // {
    //   "homeTeamName": "Chelsea",
    //   "homeTeamLogo": "assets/images/Chelsea_FC.png",
    //   "awayTeamName": "Leicester C",
    //   "awayTeamLogo": "assets/images/Leicester_City_crest.png",
    //   "leagueName": "Premier League",
    //   "matchTime": "49:30",
    //   "score": "1:2",
    //   "homeOdd": "1.8",
    //   "drawOdd": "2.1",
    //   "awayOdd": "1.3",
    // },
    // {
    //   "homeTeamName": "Arsenal",
    //   "homeTeamLogo": "assets/images/Arsenal_FC.png",
    //   "awayTeamName": "Roma",
    //   "awayTeamLogo": "assets/images/roma.png",
    //   "leagueName": "UEFA Europa League",
    //   "matchTime": "12:42",
    //   "score": "0:1",
    //   "homeOdd": "1.9",
    //   "drawOdd": "2.0",
    //   "awayOdd": "1.5",
    // },
  ];
  List<Map<String, dynamic>> get scoreBoardData => _scoreBoardData;

  void addMatch(Map<String, dynamic> newMatch) {
    _scoreBoardData.add(newMatch);
    notifyListeners();
    saveMatchs();
  }
  
  void updateMatch(int index, Map<String, dynamic> updatedMatch) {
    if (index >= 0 && index < _scoreBoardData.length) {
      _scoreBoardData[index] = updatedMatch;
      notifyListeners();
      saveMatchs();
    }
  }

  Future<void> saveMatchs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('scoreBoardData', jsonEncode(_scoreBoardData));
  }

  Future<void> loadmatchs() async {  
    final prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('scoreBoardData');
    if (data != null) {
      _scoreBoardData = List<Map<String, dynamic>>.from(jsonDecode(data));
      notifyListeners();
    }
  }
  Future<void> deleteMatch(int index) async{

    
    if (index >= 0 && index < _scoreBoardData.length){
    _scoreBoardData.removeAt(index);
    }
    saveMatchs();
    notifyListeners();

  }
}
