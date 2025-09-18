//import 'package:betting_mobile_app/ScoreAdd.dart';
import 'package:betting_mobile_app/ScoreBoard.dart';
import 'package:flutter/material.dart';
import 'package:betting_mobile_app/SelectionButton.dart';
import 'package:betting_mobile_app/Data.dart';
import 'package:betting_mobile_app/SlideScreen.dart';
import 'package:betting_mobile_app/head.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectIndex = 0;
  bool SwitchButton = false;
  List<Map<String, String>> buttonData = Data().buttonData;

  Data d = Data();

  List<Map<String, dynamic>> scoreBoardData = Data().scoreBoardData;
  
  
void addMatch(Map<String, dynamic> newMatch) {
    setState(() {
      scoreBoardData.add(newMatch);
    });
  }

  void addEvent(Map<String, dynamic> newMatch) {
    setState(() {
      scoreBoardData.add(newMatch);
    });
  }



  @override
  Widget build(BuildContext context) {


    print("string");
    print(scoreBoardData);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: Colors.white,

        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              //main containor
              width: double.infinity,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Header(Match: addMatch),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20),
                    child: Container(
                      //containor 3
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            //contaioner 2
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(114, 231, 231, 231),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search by events, teams",
                                prefixIcon: Icon(Icons.search),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: Text(
                              "Tournaments",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: const Color.fromARGB(192, 115, 115, 115),
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                  Slide(),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 20,
                      right: 20,
                    ),
                    child: Container(
                      //conraioer 5
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              "Top Events",
                              style: TextStyle(
                                color: const Color.fromARGB(192, 115, 115, 115),
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "LIVE",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Transform.scale(
                              scale: 0.75,
                              child: Switch(
                                value: SwitchButton,
                                onChanged: (value) {
                                  setState(() {
                                    SwitchButton = !SwitchButton;
                                  });
                                },
                                activeColor: const Color.fromARGB(
                                  255,
                                  255,
                                  255,
                                  255,
                                ),
                                activeTrackColor: const Color.fromARGB(
                                  255,
                                  255,
                                  89,
                                  0,
                                ),
                                inactiveTrackColor: Colors.white,
                                inactiveThumbColor: const Color.fromARGB(
                                  255,
                                  197,
                                  197,
                                  197,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    //containar 6
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(buttonData.length, (index) {
                            return Choice(
                              name: buttonData[index]["name"]!,
                              imageOn: buttonData[index]["imageOn"]!,
                              imageOff: buttonData[index]["imageOff"]!,
                              cho: selectIndex == index,
                              onTap: () {
                                setState(() {
                                  selectIndex = index;
                                });
                              },
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      ...List.generate(scoreBoardData.length, (index) {
                        return ScoreBoard(
                          homeTeamName: scoreBoardData[index]["homeTeamName"]??"",
                          homeTeamLogo: scoreBoardData[index]["homeTeamLogo"]??"",
                          awayTeamName: scoreBoardData[index]["awayTeamName"]??"",
                          awayTeamLogo: scoreBoardData[index]["awayTeamLogo"]??"",
                          leagueName: scoreBoardData[index]["leagueName"]??"",
                          matchTime: scoreBoardData[index]["matchTime"]??"",
                          score: scoreBoardData[index]["score"]??"",
                          homeOdd: scoreBoardData[index]["homeOdd"]??"",
                          drawOdd: scoreBoardData[index]["drawOdd"]??"",
                          awayOdd: scoreBoardData[index]["awayOdd"]??"",
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
