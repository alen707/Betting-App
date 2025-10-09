import 'package:betting_mobile_app/api%20connections/profile_api.dart';
import 'package:betting_mobile_app/modals/profioe_modal.dart';
import 'package:flutter/material.dart';

class ProfileinfoProvider with ChangeNotifier {
  ProfileModal? _data;
  bool _isload = true;


  ProfileModal? get data => _data;
  bool get isload=>_isload;


  
  final getprofile = ProfileApi();
  Future<void> callingapi() async {
_isload=true;
    final data = await getprofile.profileApi();
        _data=data;
        _isload =false;
        
    notifyListeners();
  }


}
