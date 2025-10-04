
import 'package:betting_mobile_app/pages/home_page.dart';
import 'package:betting_mobile_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(


        title: Text("PROFILE",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 35
          ),
        ),
        centerTitle: true,

        backgroundColor: Colors.deepOrange,


        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: (context)=>HomeScreen()));
          },
           icon: Icon(Icons.arrow_back)
           ),
        

        actions: [
          IconButton(
          onPressed: ()async{
            final prefs = await SharedPreferences.getInstance();
              await prefs.setBool("isLoggedIn", false); 

            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: (context)=>Login())
              ); 
          },
             icon: Icon(Icons.logout)
             )
        ],
       
      ),
      

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                    
              
              SizedBox(height: 20,),
              Row(
                children: [
                  Text("UserName : ",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.deepOrange
                    ),
                  ),
                  Text("name",
                  style: TextStyle(
                      fontSize: 23
                    ),
                    )
                ],
              ),
                    
                    
              SizedBox(height: 20,),
              Row(
                children: [
                  Text("Email          : ",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.deepOrange
                    ),
                  ),
                  Text("email",
                  style: TextStyle(
                      fontSize: 23,
                    ),
                    )
                ],
              ),
                    
                    
              SizedBox(height: 20,),
              Row(
                children: [
                  Text("First Name : ",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.deepOrange
                    ),
                  ),
                  Text("firstname",
                  style: TextStyle(
                      fontSize: 23
                    ),
                    )
                ],
              ),
                    
                    
              SizedBox(height: 20,),
              Row(
                children: [
                  Text("Last Name : ",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.deepOrange
                    ),
                  ),
                  Text("lastname",
                  style: TextStyle(
                      fontSize: 23
                    ),
                    )
                ],
              ),
                    
                    
              SizedBox(height: 20,),
              Row(
                children: [
                  Text("Genter        : ",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.deepOrange
                    ),
                  ),
                  Text("genter",
                  style: TextStyle(
                      fontSize: 23
                    ),
                    )
                ],
              ),
                    
                    
            ],
          ),
        )
      ),



    );
  }
}