import 'dart:convert';
import 'package:betting_mobile_app/modals/tournaments_modal.dart';
import 'package:http/http.dart' as http;

class ScoreApi {
  
  final String url= "http://192.168.1.66:3000/tournaments";


  Future<List<Tournaments>> getData() async {
    try{
      final response = await http.get(Uri.parse(url));


      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((e) =>Tournaments.fromJson(e)).toList();
      } 
      else { 
        throw Exception("Failed to load data");
      }
    // ignore: empty_catches
    }on Exception{
       return [];
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
  }


   Future<void> updateData (String id,Tournaments updatedMatch) async{
    await http.put(Uri.parse("$url/$id"),
    headers: {
      "content-Type":"application/json",
    },
    body: jsonEncode(updatedMatch.toJson())
    );
  }


}