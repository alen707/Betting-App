import 'package:betting_mobile_app/modals/tournaments_modal.dart';
import 'package:betting_mobile_app/provider/match_provider.dart';
import 'package:flutter/material.dart';
//import 'package:betting_mobile_app/Data.dart';
import 'package:provider/provider.dart';
//import 'package:betting_mobile_app/HomePage.dart';

class Add extends StatefulWidget {
  final Tournaments? matchData;
  final int? matchIndex;


  const Add({super.key,this.matchData,this.matchIndex});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {


  List<Map<String,String>> teams = [
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
  ];


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

  // List<Map<String, dynamic>> scoreBoardData = Data().scoreBoardData;

  void addMatch() {


    final newMatch  = Tournaments(
       id: widget.matchData?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
      homeTeamName: homeTeamController.text,
      homeTeamLogo: selectedHomeLogo?["logo"]??"",
      awayTeamName: awayTeamController.text,
      awayTeamLogo: selectedAwayLogo?["logo"]??"",
      leagueName: leagueController.text,
      matchTime: timeController.text,
      score: scoreController.text,
      homeOdd: homeOddController.text,
      drawOdd: drawOddController.text,
      awayOdd: awayOddController.text,
      
    );

    
      
    if (widget.matchData == null) {
      // Add new match
      context.read<MatchProvider>().addMatch(newMatch);
    } else if (widget.matchIndex != null) {

      // Update existing match
      context.read<MatchProvider>().updateMatch(newMatch.id, newMatch);
    }

    Navigator.pop(context);
  }



  @override
  void initState(){ 
    super.initState();
    
    if (widget.matchData != null) {



      homeTeamController.text = widget.matchData!.homeTeamName;
      awayTeamController.text = widget.matchData!.awayTeamName;
      leagueController.text = widget.matchData!.leagueName;
      timeController.text = widget.matchData!.matchTime;
      scoreController.text = widget.matchData!.score;
      homeOddController.text = widget.matchData!.homeOdd;
      drawOddController.text = widget.matchData!.drawOdd;
      awayOddController.text = widget.matchData!.awayOdd;
      

     
      selectedHomeLogo = teams.firstWhere(
        (team) => team["logo"] == widget.matchData!.homeTeamLogo,
        orElse: () => teams.first,
      );

      selectedAwayLogo = teams.firstWhere(
        (team) => team["logo"] == widget.matchData!.awayTeamLogo,
        orElse: () => teams.first,
      );
      // selectedHomeLogo =  selectedHomeLogoDefault;
      // selectedAwayLogo = selectedAwayLogoDefault;





    }  else if (widget.matchIndex == null) {

     
    }
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 30
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20),
              // border: Border.all(
              //   color: const Color.fromARGB(255, 0, 0, 0),
              //   width: 5,
              // ),
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
                        if (widget.matchData != null)
                        ElevatedButton(
                          onPressed: (){
                            if (widget.matchIndex != null){
                              context.read<MatchProvider>().deleteMatch(widget.matchData!.id!);
                              Navigator.pop(context);
                            }
          
                          }, 
                          child:Text("Delete"),
                          ),
                        ElevatedButton(
                          child:  Text(
                            widget.matchData == null ?'+ADD':"update",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 255, 86, 34),
                          ),
                          onPressed: () {
                            addMatch();
                            // Navigator.pop(context);
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
                          TextField(controller: homeTeamController,
                          ),
                          Text("HomeTeam Logo:", style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: DropdownButton(
                              value: selectedHomeLogo,
                              items: teams.map((logo) {
                                    return DropdownMenuItem(
                                      value: logo,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            logo["logo"]!, 
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
                                  selectedHomeLogo = value;
                                });
                              },
                              hint: Text(
                                "Choose a Team",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Text("AwayTeam Name:", style: TextStyle(fontSize: 20)),
                          TextField(controller: awayTeamController),
                          Text("AwayTeam Logo:", style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: DropdownButton(
                              value: selectedAwayLogo,
                              items:teams.map((logo) {
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
                              hint: Text(
                                "Choose a Team",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
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
        ),
      ),
    );
  }
}
