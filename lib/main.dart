import 'package:betting_mobile_app/login_page.dart';
import 'package:betting_mobile_app/provider/match_provider.dart';
import 'package:betting_mobile_app/provider/newName_provider.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:provider/provider.dart';

//import 'ScoreAdd.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final matchProvider =MatchProvider();
  await matchProvider.loadmatchs();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider.value(value: matchProvider),
      ChangeNotifierProvider(create: (_) => NewName())
    ],
     child: const MyApp(),
    ),
    
     
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          
      
  
      debugShowCheckedModeBanner: false,
      
      
      home:
      // Add()
    
        //HomeScreen(),
        //body: SecondScreen(),
       Login()
      
      
    );
  }
}