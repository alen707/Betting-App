import 'package:betting_mobile_app/provider/match_provider.dart';
import 'package:flutter/material.dart';
import 'package:betting_mobile_app/Data.dart';
import 'package:provider/provider.dart';
//import 'package:betting_mobile_app/HomePage.dart';

class Add extends StatefulWidget {


  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final homeTeamController = TextEditingController();
  final awayTeamController = TextEditingController();
  final leagueController = TextEditingController();
  final timeController = TextEditingController();
  final scoreController = TextEditingController();
  final homeOddController = TextEditingController();
  final drawOddController = TextEditingController();
  final awayOddController = TextEditingController();

  Map<String, String>? selectedHomeLogo;
  Map<String, String>? selectedAwayLogo;

  List<Map<String, dynamic>> scoreBoardData = Data().scoreBoardData;

  void addMatch() {
    Map<String, dynamic> test = {
      "homeTeamName": homeTeamController.text,
      "homeTeamLogo": selectedHomeLogo?["logo"],
      "awayTeamName": awayTeamController.text,
      "awayTeamLogo": selectedAwayLogo?["logo"],
      "leagueName": leagueController.text,
      "matchTime": timeController.text,
      "score": scoreController.text,
      "homeOdd": homeOddController.text,
      "drawOdd": drawOddController.text,
      "awayOdd": awayOddController.text,
    };
    setState(() {
      //widget.onAddMatch(test);
      //scoreBoardData.add(test);
      //print(scoreBoardData);
      context.read<MatchProvider>().addMatch(test);

      // Clear fields
      homeTeamController.clear();
      awayTeamController.clear();
      leagueController.clear();
      timeController.clear();
      scoreController.clear();
      homeOddController.clear();
      drawOddController.clear();
      awayOddController.clear();
      selectedHomeLogo = null;
      selectedAwayLogo = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color.fromARGB(255, 0, 0, 0),
            width: 5,
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.only(top: 35, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      child: const Text(
                        '< Back',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 86, 34),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    ElevatedButton(
                      child: const Text(
                        '+ADD',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 86, 34),
                      ),
                      onPressed: () {
                        addMatch();

                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "ADD SCORE",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text("HomeTeam Name:", style: TextStyle(fontSize: 20)),
                      TextField(controller: homeTeamController),
                      Text("HomeTeam Logo:", style: TextStyle(fontSize: 20)),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: DropdownButton(
                          items:
                              [
                                {
                                  "name": "Chelsea",
                                  "logo": "assets/images/Chelsea_FC.png",
                                },
                                {
                                  "name": "Leicester C",
                                  "logo":
                                      "assets/images/Leicester_City_crest.png",
                                },
                                {
                                  "name": "Arsenal",
                                  "logo": "assets/images/Arsenal_FC.png",
                                },
                                {
                                  "name": "Roma",
                                  "logo": "assets/images/roma.png",
                                },
                              ].map((logo) {
                                return DropdownMenuItem(
                                  value: logo,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        logo["logo"]!, // ✅ show logo image
                                        width: 24,
                                        height: 24,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        logo["name"]!,
                                      ), // ✅ only use name string
                                    ],
                                  ),
                                );
                              }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedHomeLogo = value;
                            });
                          },
                        ),
                      ),
                      Text("AwayTeam Name:", style: TextStyle(fontSize: 20)),
                      TextField(controller: awayTeamController),
                      Text("AwayTeam Logo:", style: TextStyle(fontSize: 20)),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: DropdownButton(
                          items:
                              [
                                {
                                  "name": "Chelsea",
                                  "logo": "assets/images/Chelsea_FC.png",
                                },
                                {
                                  "name": "Leicester C",
                                  "logo":
                                      "assets/images/Leicester_City_crest.png",
                                },
                                {
                                  "name": "Arsenal",
                                  "logo": "assets/images/Arsenal_FC.png",
                                },
                                {
                                  "name": "Roma",
                                  "logo": "assets/images/roma.png",
                                },
                              ].map((logo) {
                                return DropdownMenuItem(
                                  value: logo,
                                  child:Row(
                                    children: [
                                      Image.asset(
                                        logo["logo"]!,
                                        width: 24,
                                        height: 24,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        logo["name"]!,
                                      ), 
                                    ],
                                  ),
                                );
                              }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedAwayLogo = value;
                            });
                          },
                        ),
                      ),
                      Text("league Name:", style: TextStyle(fontSize: 20)),
                      TextField(controller: leagueController),
                      Text("matchTime:", style: TextStyle(fontSize: 20)),
                      TextField(controller: timeController),
                      Text("score:", style: TextStyle(fontSize: 20)),
                      TextField(controller: scoreController),
                      Text("homeOdd:", style: TextStyle(fontSize: 20)),
                      TextField(controller: homeOddController),
                      Text("drawOdd:", style: TextStyle(fontSize: 20)),
                      TextField(controller: drawOddController),
                      Text("awayOdd:", style: TextStyle(fontSize: 20)),
                      TextField(controller: awayOddController),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
