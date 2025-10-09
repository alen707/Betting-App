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
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    final profileinfoprovider = Provider.of<ProfileinfoProvider>(
      context,
      listen: false,
    );
    await profileinfoprovider.callingapi();
  }

  @override
  Widget build(BuildContext context) {
    final profileinfo = context.watch<ProfileinfoProvider>();
    final data = profileinfo.data;
    final isload = profileinfo.isload;

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
                // ignore: use_build_context_synchronously
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),

      body: isload || data == null
          ? SafeArea(child: Center(child: CircularProgressIndicator()))
          : SafeArea(
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
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.deepOrange,
                          ),
                        ),
                        Text(
                          data.username ?? "username",
                          style: TextStyle(fontSize: 23),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "Email          : ",
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.deepOrange,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            data.email ?? "email",
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
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.deepOrange,
                          ),
                        ),
                        Text(
                          data.firstName ?? "firstname",
                          style: TextStyle(fontSize: 23),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "Last Name : ",
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.deepOrange,
                          ),
                        ),
                        Text(
                          data.lastName ?? "lastname",
                          style: TextStyle(fontSize: 23),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "Genter        : ",
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.deepOrange,
                          ),
                        ),
                        Text(
                          data.gender ?? "genter",
                          style: TextStyle(fontSize: 23),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
