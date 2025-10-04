import 'package:flutter/material.dart';

class NewName with ChangeNotifier{
   // ignore: non_constant_identifier_names
   String _Name ="WADE WARREN";
   String get name => _Name;



   void add(String newName){
    _Name = newName;
    notifyListeners();

   }


}