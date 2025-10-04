class Tournaments {
  final String id;
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


Tournaments({
  required this.id,
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

  factory Tournaments.fromJson(Map<String, dynamic> json) {
    return Tournaments(
      id: json['id'],
      homeTeamName: json['homeTeamName'],
      homeTeamLogo: json['homeTeamLogo'],
      awayTeamName: json['awayTeamName'],
      awayTeamLogo: json['awayTeamLogo'],
      leagueName: json['leagueName'],
      matchTime: json['matchTime'],
      score: json['score'],
      homeOdd: json['homeOdd'],
      drawOdd: json['drawOdd'],
      awayOdd: json['awayOdd'],
    );
  }


 Map<String, dynamic> toJson() {
    return {
      'id': id,
      'homeTeamName': homeTeamName,
      'homeTeamLogo': homeTeamLogo,
      'awayTeamName': awayTeamName,
      'awayTeamLogo': awayTeamLogo,
      'leagueName': leagueName,
      'matchTime': matchTime,
      'score': score,
      'homeOdd': homeOdd,
      'drawOdd': drawOdd,
      'awayOdd': awayOdd,
    };
  }

}