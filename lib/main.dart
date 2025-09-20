//import 'package:betting_mobile_app/second.dart';
import 'package:betting_mobile_app/provider/match_provider.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:provider/provider.dart';
//import 'ScoreAdd.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MatchProvider(),
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
    
        HomeScreen(),
        //body: SecondScreen(),
         
      
    );
  }
}