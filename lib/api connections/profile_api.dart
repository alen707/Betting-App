import 'dart:convert';
import 'package:betting_mobile_app/api%20connections/refresh_api.dart';
import 'package:betting_mobile_app/modals/profioe_modal.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileApi {
  final String url = 'https://dummyjson.com/auth/me';
  final refresh = Refresh();

  Future<ProfileModal> profileApi() async {
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
      return ProfileModal.fromJson(data);
    } else {
      await refresh.refresh();
      ProfileApi();
    }
    return ProfileModal.fromJson(data);
  }
}
