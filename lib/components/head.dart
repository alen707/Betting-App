import 'package:betting_mobile_app/api%20connections/profile_api.dart';
import 'package:betting_mobile_app/components/change_name.dart';
import 'package:betting_mobile_app/components/score_add.dart';
import 'package:betting_mobile_app/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Header extends StatefulWidget {
  
  
    //  final prefs =  SharedPreferences.getInstance();
    // final refreshtoken = prefs.getString("refreshtoken") ?? false;
  
  const Header({super.key });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String? userName; 
    @override
      void initState() {
    super.initState();
    loadUsername(); // Load username when widget mounts
  }
  Map<String, dynamic> add(Map<String, dynamic> newMatch){
      
    return {};
  }

    Future<void> loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    if (mounted) {
      setState(() {
        userName = prefs.getString("username");
      });
    }
  }


  @override
  Widget build(BuildContext context) {
  
    // context.watch<NewName>().username;

    final getProfileData= ProfileApi();
     Future pro() async{
            await getProfileData.getProfileData(context);
              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(context, 
              MaterialPageRoute(builder: (context)=>Profile()));
  }

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hello,",
                      style: TextStyle(
                        //color: const Color.fromARGB(252, 0, 0, 0),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                         pro();
                        },
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            userName ??"username" ,
                            style: TextStyle(
                              color: const Color.fromARGB(250, 0, 0, 0),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    Row(
                      children: [
                        UserPopUp(),
                      Container(
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                  
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        iconSize: 30,
                        onPressed: () {
                          Scaffold.of(context).showBottomSheet((
                            BuildContext context,
                          ) {
                            return Add();
                          });
                        },
                      ),
                    ),
                      ],
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}





