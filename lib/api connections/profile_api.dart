import 'dart:convert';
import 'package:betting_mobile_app/api%20connections/refresh_api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileApi {
  final String url = 'https://dummyjson.com/auth/me';
  final refresh = Refresh();

  Future<Map<String, dynamic>> getProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    final tokens = prefs.getString("acesstoken");

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $tokens',
        'Content-Type': 'application/json',
      },
    );

    Map<String, dynamic> data = {};

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
    } else {
      await refresh.refresh();
      ProfileApi();
    }

    return data;
  }
}
