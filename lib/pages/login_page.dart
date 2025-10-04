import 'package:betting_mobile_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final userName = TextEditingController();
  final password = TextEditingController();
  bool hidePass=true;
  bool load=false;



  Future<void> login() async {
    final responese = await http.post(
      Uri.parse('https://dummyjson.com/auth/login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": userName.text, "password": password.text}),
    );
  
    
    if (responese.statusCode==200){
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool("isLoggedIn", true);
      print(responese.body);
      

      Navigator.pushReplacement(
        context,
       MaterialPageRoute(
        builder: (context)=>HomeScreen()
        )
        );
    }else{
      print("login failed");
      print("login failed");
      
      print("login failed");
      print("login failed");
      setState(() {
        load=!load;
      });
      
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),

              child: Center(
                child: Container(
                  height: 275,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.deepOrangeAccent,
                      width: 5,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Text(
                          "LOGIN",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextField(
                              controller: userName,
                              decoration: InputDecoration(
                                labelText: "User Name",
                                border: OutlineInputBorder(),
                              ),
                            ),

                            SizedBox(height: 10),
                            TextField(
                              obscureText: hidePass,
                              controller: password,
                              decoration: InputDecoration(
                                labelText: "Password",
                                border: OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      if(hidePass==true){
                                      hidePass=false;
                                    }else{
                                      hidePass=true;
                                    }
                                    });
                                  }, 
                                  icon: Icon(
                                    hidePass? Icons.visibility:Icons.visibility_off
                                    )
                                  )
                              ),
                            ),

                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () async{
                                setState(() {
                                  load=!load;
                                });
                                print("looooooooooodddd");
                                print("looooooooooodddd");
                                print("looooooooooodddd");

                                await Future.delayed(const Duration(seconds: 1));

                                login();
                                
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepOrangeAccent,
                                foregroundColor: Colors.white,
                              ),
                              child: load?  CircularProgressIndicator() : Text("Login") ,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
