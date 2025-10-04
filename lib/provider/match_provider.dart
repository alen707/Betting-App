import 'package:betting_mobile_app/modals/tournaments_modal.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MatchProvider with ChangeNotifier {
  List<Tournaments> _scoreBoardData = [];

  
  List<Tournaments> get scoreBoardData => _scoreBoardData;
  final String url= "http://192.168.1.66:3000/tournaments";

  void addMatch(Tournaments newMatch) {
    _scoreBoardData.add(newMatch);
    postData(newMatch);
    notifyListeners();
    //saveMatchs();
  }

  void updateMatch(String id, Tournaments updatedMatch) {
    // if (index >= 0 && index < _scoreBoardData.length) {
    //   _scoreBoardData[index] = updatedMatch;
    //   notifyListeners();
    //   saveMatchs();
    // }
    updateData(id,updatedMatch);


  }

  Future<void> saveMatchs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('scoreBoardData', jsonEncode(_scoreBoardData));
  }

  Future<void> loadmatchs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getString('scoreBoardData');
    getData();  
    notifyListeners();
    //  if (data != null) {
    //    _scoreBoardData = List<Map<String, dynamic>>.from(jsonDecode(data));
    //notifyListeners();
    //  }
  }



  Future<void> deleteMatch(String id) async {
    // if (index >= 0 && index < _scoreBoardData.length) {
    //   _scoreBoardData.removeAt(index);
    // }
    deleteData(id);
    // saveMatchs();
    notifyListeners();
  }




  Future<void> getData() async {
    try{
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
      
        final List<dynamic> data = jsonDecode(response.body);
        _scoreBoardData = data.map((e) =>Tournaments.fromJson(e)).toList();
        notifyListeners();
      } else {
        
        throw Exception("Failed to load data");
      }
    // ignore: empty_catches
    }on Exception{

    }
  }



  Future<void> postData(Tournaments newMatch) async{
    await http.post(Uri.parse(url),
    headers :{
      "Content-Type" : "application/json",  
    },
    body: jsonEncode(newMatch.toJson())
    );
  }


  Future<void> deleteData(String id) async{
    await http.delete(Uri.parse('$url/$id'));
    notifyListeners();
    loadmatchs();
  }


  Future<void> updateData (String id,Tournaments updatedMatch) async{
    await http.put(Uri.parse("$url/$id"),
    headers: {
      "content-Type":"application/json",
    },
    body: jsonEncode(updatedMatch.toJson())
    );
    loadmatchs();
  }




}
