import 'package:flutter/material.dart';

class NewName with ChangeNotifier{
   String _Name ="WADE WARREN";
   String get name => _Name;



   void add(String newName){
    _Name = newName;
    notifyListeners();

   }


}