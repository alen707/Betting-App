import 'package:betting_mobile_app/api%20connections/score_api.dart';
import 'package:betting_mobile_app/modals/tournaments_modal.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class MatchProvider with ChangeNotifier {
  final ScoreApi _api = ScoreApi();
  List<Tournaments> _scoreBoardData = [];

  List<Tournaments> get scoreBoardData => _scoreBoardData;

  void addMatch(Tournaments newMatch) {
    _scoreBoardData.add(newMatch);
    _api.postData(newMatch);
    notifyListeners();
  }

  void updateMatch(String id, Tournaments updatedMatch) {
    _api.updateData(id, updatedMatch);
    loadmatchs();
  }

  Future<void> saveMatchs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('scoreBoardData', jsonEncode(_scoreBoardData));
  }

  Future<void> loadmatchs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getString('scoreBoardData');
    _scoreBoardData = await _api.getData();
    notifyListeners();
  }

  Future<void> deleteMatch(String id) async {
    _api.deleteData(id);
    loadmatchs();
    notifyListeners();
  }
}
