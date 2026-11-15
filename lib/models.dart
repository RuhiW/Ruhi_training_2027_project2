class Match {
  final int matchNumber;
  final String compLevel;
  final List<String> redTeamKeys;
  final List<String> blueTeamKeys;
  Match({
    required this.matchNumber,
    required this.compLevel,
    required this.redTeamKeys,
    required this.blueTeamKeys,
  });
  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      matchNumber: json['match_number'],
      compLevel: json['comp_level'],
      redTeamKeys: List<String>.from(json['alliances']['red']['team_keys']),
      blueTeamKeys: List<String>.from(json['alliances']['blue']['team_keys']),
    );
  }
}

class Team {
  final int teamNumber;
  final String teamName;

  Team({required this.teamNumber, required this.teamName});
  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      teamNumber: json['team_number'],
      teamName: json['nickname'] ?? 'Unknown Team',
    );
  }
}
