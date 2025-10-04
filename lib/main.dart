import 'package:betting_mobile_app/pages/login_page.dart';
import 'package:betting_mobile_app/pages/profile_page.dart';
import 'package:betting_mobile_app/provider/match_provider.dart';
import 'package:betting_mobile_app/provider/newName_provider.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'ScoreAdd.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final matchProvider =MatchProvider();
  await matchProvider.loadmatchs();

    //WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider.value(value: matchProvider),
      ChangeNotifierProvider(create: (_) => NewName())
    ],
     child:  MyApp(isLoggedIn:isLoggedIn),
    ),
    
     
    );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key,required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          
      
  
      debugShowCheckedModeBanner: false,
      
      
      home: isLoggedIn ? HomeScreen() : Login(),
      // Add()
    
        //HomeScreen(),
        //body: SecondScreen(),
       //Login()
      //home: Profile(),
      
    );
  }
}