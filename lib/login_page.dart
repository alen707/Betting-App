import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                              decoration: InputDecoration(
                                labelText: "User Name",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              decoration: InputDecoration(
                                labelText: "Password",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {},
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
