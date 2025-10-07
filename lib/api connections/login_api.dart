import 'dart:convert';
import 'package:betting_mobile_app/provider/new_name_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApi {

  Future<bool> login(userName,password,context) async {

    final responese = await http.post(
     Uri.parse('https://dummyjson.com/auth/login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": userName.text, "password": password.text,"expiresInMins" : 1}),
    );


    if (responese.statusCode==200){
      final data = jsonDecode(responese.body);

       final acesstoken = data['accessToken'];
       final name =data["username"];
       final refreshtoken=data["refreshToken"];
       final usernameProvider = Provider.of<NewName>(context,listen: false);
      usernameProvider.add(acesstoken, name,refreshtoken);
     

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool("isLoggedIn", true);
      await prefs.setString("acesstoken", data["accessToken"]);
      await prefs.setString("refreshtoken", data["refreshToken"]);
      await prefs.setString("username", data["username"]);
      return true;
    }
    else{
      return false;
    }

  }
}