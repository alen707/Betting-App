import 'package:betting_mobile_app/api%20connections/profile_api.dart';
import 'package:flutter/material.dart';

class Profileinfo with ChangeNotifier {
  String? _username;
  String? _email;
  String? _firstname;
  String? _lastname;
  String? _gender;

  String? get username => _username;
  String? get email => _email;
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get gender => _gender;
  final getprofile = ProfileApi();
  void callingapi() async {
    final data = await getprofile.getProfileData();

    info(data);
  }

  void info(Map<String, dynamic> data) {
    _username = data["username"];
    _email = data["email"];
    _firstname = data["firstname"];
    _lastname = data["lastname"];
    _gender = data["genter"];
    notifyListeners();
  }
}
