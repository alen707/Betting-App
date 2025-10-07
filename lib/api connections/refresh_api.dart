import 'dart:convert';

import 'package:betting_mobile_app/api%20connections/profile_api.dart';
import 'package:betting_mobile_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Refresh {
  
  final String url = 'https://dummyjson.com/auth/refresh';
  

  Future<void> refresh(BuildContext context) async {

    final prefs = await SharedPreferences.getInstance();
    final refreshtoken = prefs.getString("refreshtoken") ?? false;

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'refreshToken': refreshtoken}),
    );

    if (response.statusCode == 200) {
  


      final data = jsonDecode(response.body);

      final newAccessToken = data['accessToken'];
      final newRefreshToken = data['refreshToken'];

      await prefs.setString("acesstoken", newAccessToken);
      await prefs.setString("refreshtoken", newRefreshToken);
      final profileapi=ProfileApi();

      // ignore: use_build_context_synchronously
      profileapi.getProfileData(context);

    } else {

      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    }
  }
}
