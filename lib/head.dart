import 'package:betting_mobile_app/ScoreAdd.dart';
import 'package:flutter/material.dart';
//import 'package:betting_mobile_app/HomePage.dart';

class Header extends StatelessWidget {
  
  
  const Header({super.key });

  Map<String, dynamic> add(Map<String, dynamic> newMatch){
    return {};
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
          child: Container(
            // containor 1
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Text(
                    "Hello,",
                    style: TextStyle(
                      color: const Color.fromARGB(252, 0, 0, 0),
                      fontSize: 20,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Text(
                        "WADE WARREN",
                        style: TextStyle(
                          color: const Color.fromARGB(252, 0, 0, 0),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
                            return Add(
                              );
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

