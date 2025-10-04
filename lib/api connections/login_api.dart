import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginApi {

  Future<bool> login(userName,password) async {

    final responese = await http.post(
      Uri.parse('https://dummyjson.com/auth/login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": userName.text, "password": password.text}),
    );

    
    if (responese.statusCode==200){
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool("isLoggedIn", true);
      return true;
    }
    else{
      return false;
    }

  }
}