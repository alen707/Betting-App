import 'package:flutter/material.dart';



class ScoreBoard extends StatefulWidget {
  final String homeTeamName;
  final String homeTeamLogo;
  final String awayTeamName;
  final String awayTeamLogo;
  final String leagueName;
  final String matchTime;
  final String score;
  final String homeOdd;
  final String drawOdd;
  final String awayOdd;
  const ScoreBoard({
    super.key,
    required this.homeTeamName,
    required this.homeTeamLogo,
    required this.awayTeamName,
    required this.awayTeamLogo,
    required this.leagueName,
    required this.matchTime,
    required this.score,
    required this.homeOdd,
    required this.drawOdd,
    required this.awayOdd,
  });

  @override
  State<ScoreBoard> createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12, top: 16),
      padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color.fromARGB(255, 191, 191, 191),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  //width: 100,
                  height: 100,
                  child: Image.asset(widget.homeTeamLogo, fit: BoxFit.cover),
                ),
                Text(
                  widget.homeTeamName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 226, 226, 226),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(child: Text(widget.homeOdd)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(widget.leagueName, style: TextStyle(fontSize: 12)),
                Text(
                  widget.score,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 94, 0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Text(
                      widget.matchTime,
                      style: TextStyle(
                        fontSize: 15,

                        //fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 100,
                  height: 30,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 226, 226, 226),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(child: Text(widget.drawOdd)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  //width: 75,
                  height: 100,
                  child: Image.asset(widget.awayTeamLogo, fit: BoxFit.cover),
                ),
                Text(
                  widget.awayTeamName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 226, 226, 226),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(child: Text(widget.awayOdd)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
