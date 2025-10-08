import 'package:flutter/material.dart';

class NewName with ChangeNotifier {
  // ignore: non_constant_identifier_names
  //String _Name ="WADE WARREN";
  String? _acesstoken;
  String? _username;
  String? _refreshtoken;

  String? get token => _acesstoken;
  String? get username => _username;
  String? get refreshtoken => _refreshtoken;

  void add(String acesstoken, String username, String refreshtoken) {
    // _Name = newName;
    _acesstoken = acesstoken;
    _username = username;
    _refreshtoken = refreshtoken;
    notifyListeners();
  }
}
