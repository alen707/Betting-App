import 'dart:convert';
import 'package:betting_mobile_app/api%20connections/refresh_api.dart';
import 'package:betting_mobile_app/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileApi {
  
  final String url = 'https://dummyjson.com/auth/me';
  final refresh=Refresh();


  

  Future<void> getProfileData(BuildContext context) async {

    try {
      final prefs = await SharedPreferences.getInstance();
     final tokens  = prefs.getString("acesstoken") ?? false;

      //  final usernameProvider = Provider.of<NewName>(context, listen: false);
      // final token = usernameProvider.token;

      final response = await http.get(
      Uri.parse(url),
      headers: {
    'Authorization': 'Bearer $tokens',
    'Content-Type': 'application/json',
  },
);




      if (response.statusCode == 200) {


        final data = jsonDecode(response.body);
        final username = data['username'];
        final email = data['email'];
        final firstname = data['firstName'];
        final lastname = data['lastName'];
        final genter = data['gender'];


        // ignore: use_build_context_synchronously
        final  profileinfo= Provider.of<Profileinfo>(context,listen: false);
        profileinfo.info(username, email, firstname, lastname, genter);

        
      
      
      } else {
  
        // ignore: use_build_context_synchronously
        refresh.refresh(context);

      }
    // ignore: empty_catches
    } catch (e) {

    }
  }
}
