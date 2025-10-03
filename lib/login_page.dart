import 'package:betting_mobile_app/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final userName = TextEditingController();
  final password = TextEditingController();



  Future<void> login() async {
    final responese = await http.post(
      Uri.parse('https://dummyjson.com/auth/login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": userName.text, "password": password.text}),
    );
  
    
    if (responese.statusCode==200){
      Navigator.pushReplacement(
        context,
       MaterialPageRoute(
        builder: (context)=>HomeScreen()
        )
        );
    }else{
      print("lodin faild");
      print("lodin faild");
      print("lodin faild");
      print("lodin faild");
      

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
                              controller: password,
                              decoration: InputDecoration(
                                labelText: "Password",
                                border: OutlineInputBorder(),
                              ),
                            ),

                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                login();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepOrangeAccent,
                                foregroundColor: Colors.white,
                              ),
                              child: Text("Login"),
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
