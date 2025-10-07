import 'package:flutter/material.dart';

class Profileinfo with ChangeNotifier{
 String? _username;
 String? _email;
 String? _firstname;
 String? _lastname;
 String? _gender;
 
String? get username => _username;
String? get  email=> _email;
String? get  firstname=> _firstname;
String? get  lastname=> _lastname;
String? get  gender=> _gender;

   void info(String username,String email,String firstname,String lastname,String genter){
   // _Name = newName;
    _username = username;
    _email=email;
    _firstname=firstname;
    _lastname=lastname;
    _gender=genter;
    notifyListeners();

   }

}