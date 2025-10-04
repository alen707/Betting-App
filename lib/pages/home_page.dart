//import 'package:betting_mobile_app/ScoreAdd.dart';
import 'package:betting_mobile_app/components/ScoreAdd.dart';
import 'package:betting_mobile_app/components/ScoreBoard.dart';
//import 'package:betting_mobile_app/main.dart';
import 'package:betting_mobile_app/provider/match_provider.dart';
import 'package:flutter/material.dart';
import 'package:betting_mobile_app/components/SelectionButton.dart';
import 'package:betting_mobile_app/constants/Data.dart';
import 'package:betting_mobile_app/components/SlideScreen.dart';
import 'package:betting_mobile_app/components/head.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectIndex = 0;
  bool SwitchButton = false;
  List<Map<String, String>> buttonData = Data().buttonData;

  //Data d = Data();

  // List<Map<String, dynamic>> scoreBoardData = Data().scoreBoardData;

  // void addMatch(Map<String, dynamic> newMatch) {
  //   setState(() {
  //     scoreBoardData.add(newMatch);
  //   });
  // }

  // void addEvent(Map<String, dynamic> newMatch) {
  //   setState(() {
  //     scoreBoardData.add(newMatch);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // print("string");
    // print(scoreBoardData);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,

        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              //main containor
              width: double.infinity,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Header(),
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
                      Consumer<MatchProvider>(
                        builder: (context, matchProvider, child) {
                          return Column(
                            children: List.generate(
                              matchProvider.scoreBoardData.length,
                              (index) {
                                final match =
                                    matchProvider.scoreBoardData[index];
                                return InkWell(
                                  onTap: () {
                                    print("click on scorebord ");
                                    Navigator.push(
                                      context, 
                                      MaterialPageRoute(builder: (context)=>Add(matchIndex: index, matchData: match,)),
                                      );
                                  },
                                  child: ScoreBoard(
                                    homeTeamName: match.homeTeamName,
                                    homeTeamLogo: match.homeTeamLogo,
                                    awayTeamName: match.awayTeamName,
                                    awayTeamLogo: match.awayTeamLogo,
                                    leagueName: match.leagueName,
                                    matchTime: match.matchTime,
                                    score: match.score,
                                    homeOdd: match.homeOdd,
                                    drawOdd: match.drawOdd,
                                    awayOdd: match.awayOdd,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
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
