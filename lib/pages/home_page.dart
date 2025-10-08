import 'package:betting_mobile_app/components/score_add.dart';
import 'package:betting_mobile_app/components/score_board.dart';
import 'package:betting_mobile_app/provider/match_provider.dart';
import 'package:flutter/material.dart';
import 'package:betting_mobile_app/components/selection_button.dart';
import 'package:betting_mobile_app/constants/data.dart';
import 'package:betting_mobile_app/components/slide_screen.dart';
import 'package:betting_mobile_app/components/head.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectIndex = 0;
  bool switchButton = false;
  List<Map<String, String>> buttonData = Data().buttonData;

  @override
  Widget build(BuildContext context) {
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
                        SizedBox(
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
                  Slide(),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Top Events",
                          style: TextStyle(
                            color: const Color.fromARGB(192, 115, 115, 115),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
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
                        Transform.scale(
                          scale: 0.75,
                          child: Switch(
                            value: switchButton,
                            onChanged: (value) {
                              setState(() {
                                switchButton = !switchButton;
                              });
                            },
                            activeThumbColor: const Color.fromARGB(
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
                      ],
                    ),
                  ),
                  SingleChildScrollView(
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Add(
                                          matchIndex: index,
                                          matchData: match,
                                        ),
                                      ),
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
