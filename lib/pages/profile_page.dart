import 'package:betting_mobile_app/pages/home_page.dart';
import 'package:betting_mobile_app/pages/login_page.dart';
import 'package:betting_mobile_app/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      // ignore: use_build_context_synchronously
      context.read<Profileinfo>().callingapi();
    });
  }

  @override
  Widget build(BuildContext context) {
    final String? userName = context.watch<Profileinfo>().username;
    final String? email = context.watch<Profileinfo>().email;
    final String? firstName = context.watch<Profileinfo>().firstname;
    final String? lastName = context.watch<Profileinfo>().lastname;
    final String? gender = context.watch<Profileinfo>().gender;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PROFILE",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
        centerTitle: true,

        backgroundColor: Colors.deepOrange,

        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),

        actions: [
          IconButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setBool("isLoggedIn", false);

              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "UserName : ",
                    style: TextStyle(fontSize: 23, color: Colors.deepOrange),
                  ),
                  Text(userName ?? "username", style: TextStyle(fontSize: 23)),
                ],
              ),

              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Email          : ",
                    style: TextStyle(fontSize: 23, color: Colors.deepOrange),
                  ),
                  Expanded(
                    child: Text(
                      email ?? "email",
                      style: TextStyle(fontSize: 23),
                      softWrap: true,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "First Name : ",
                    style: TextStyle(fontSize: 23, color: Colors.deepOrange),
                  ),
                  Text(
                    firstName ?? "firstname",
                    style: TextStyle(fontSize: 23),
                  ),
                ],
              ),

              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Last Name : ",
                    style: TextStyle(fontSize: 23, color: Colors.deepOrange),
                  ),
                  Text(lastName ?? "lastname", style: TextStyle(fontSize: 23)),
                ],
              ),

              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Genter        : ",
                    style: TextStyle(fontSize: 23, color: Colors.deepOrange),
                  ),
                  Text(gender ?? "genter", style: TextStyle(fontSize: 23)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
