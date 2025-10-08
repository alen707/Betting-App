import 'package:betting_mobile_app/api%20connections/login_api.dart';
import 'package:betting_mobile_app/api%20connections/profile_api.dart';
import 'package:betting_mobile_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final userName = TextEditingController(text: "emilys");
  final password = TextEditingController(text: "emilyspass");
  bool hidePass = true;
  bool load = false;
  final getProfileData = ProfileApi();

  Future<void> login() async {
    final login = LoginApi();
    final test = await login.login(userName, password, context);
    // ignore: unrelated_type_equality_checks
    if (test == true) {
      // ignore: use_build_context_synchronously
      await getProfileData.getProfileData();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      setState(() {
        load = !load;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),

            child: Center(
              child: Container(
                height: 275,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.deepOrangeAccent, width: 5),
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
                                onPressed: () {
                                  setState(() {
                                    if (hidePass == true) {
                                      hidePass = false;
                                    } else {
                                      hidePass = true;
                                    }
                                  });
                                },
                                icon: Icon(
                                  hidePass
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                load = !load;
                              });

                              await Future.delayed(const Duration(seconds: 1));

                              login();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrangeAccent,
                              foregroundColor: Colors.white,
                            ),
                            child: load
                                ? CircularProgressIndicator()
                                : Text("Login"),
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
    );
  }
}
