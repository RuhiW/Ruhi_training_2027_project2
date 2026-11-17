import 'package:training_2027_project2/alliance.dart';

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
enum EndgameResult {
  noScore,
  parked,
  shallowCage,
  deepCage,
}

class ScoutingRecord {
  final String eventKey;
  final int matchNumber;
  final int teamNumber;
  final AlliancePosition alliancePosition;
  final int autoCoralL1;
  final int autoCoralL2;
  final int autoCoralL3;
  final int autoCoralL4;
  final int autoAlgaeNet;
  final int autoAlgaeProcessed;
  final int teleopCoralL1;
  final int teleopCoralL2;
  final int teleopCoralL3;
  final int teleopCoralL4;
  final int teleopMissL1;
  final int teleopMissL2;
  final int teleopMissL3;
  final int teleopMissL4;
  final int teleopAlgaeNet;
  final int teleopAlgaeProcessed;
  final bool? broke;
  final int penalties;
  final EndgameResult? endgameResult;
  final DateTime createdAt;

  ScoutingRecord({
    required this.eventKey,
    required this.matchNumber,
    required this.teamNumber,
    required this.alliancePosition,

    this.autoCoralL1 = 0,
    this.autoCoralL2 = 0,
    this.autoCoralL3 = 0,
    this.autoCoralL4 = 0,
    this.autoAlgaeNet = 0,
    this.autoAlgaeProcessed = 0,

    this.teleopCoralL1 = 0,
    this.teleopCoralL2 = 0,
    this.teleopCoralL3 = 0,
    this.teleopCoralL4 = 0,
    this.teleopMissL1 = 0,
    this.teleopMissL2 = 0,
    this.teleopMissL3 = 0,
    this.teleopMissL4 = 0,
    this.teleopAlgaeNet = 0,
    this.teleopAlgaeProcessed = 0,
    this.broke,
    this.penalties = 0,

    this.endgameResult,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  ScoutingRecord copyWith({
    int? autoCoralL1,
    int? autoCoralL2,
    int? autoCoralL3,
    int? autoCoralL4,
    int? autoAlgaeNet,
    int? autoAlgaeProcessed,

    int? teleopCoralL1,
    int? teleopCoralL2,
    int? teleopCoralL3,
    int? teleopCoralL4,
    int? teleopMissL1,
    int? teleopMissL2,
    int? teleopMissL3,
    int? teleopMissL4,
    int? teleopAlgaeNet,
    int? teleopAlgaeProcessed,
    bool? broke,
    int? penalties,

    EndgameResult? endgameResult,
  }) {
    return ScoutingRecord(
      eventKey: eventKey,
      matchNumber: matchNumber,
      teamNumber: teamNumber,
      alliancePosition: alliancePosition,

      autoCoralL1: autoCoralL1 ?? this.autoCoralL1,
      autoCoralL2: autoCoralL2 ?? this.autoCoralL2,
      autoCoralL3: autoCoralL3 ?? this.autoCoralL3,
      autoCoralL4: autoCoralL4 ?? this.autoCoralL4,
      autoAlgaeNet: autoAlgaeNet ?? this.autoAlgaeNet,
      autoAlgaeProcessed:
      autoAlgaeProcessed ?? this.autoAlgaeProcessed,

      teleopCoralL1: teleopCoralL1 ?? this.teleopCoralL1,
      teleopCoralL2: teleopCoralL2 ?? this.teleopCoralL2,
      teleopCoralL3: teleopCoralL3 ?? this.teleopCoralL3,
      teleopCoralL4: teleopCoralL4 ?? this.teleopCoralL4,
      teleopMissL1: teleopMissL1 ?? this.teleopMissL1,
      teleopMissL2: teleopMissL2 ?? this.teleopMissL2,
      teleopMissL3: teleopMissL3 ?? this.teleopMissL3,
      teleopMissL4: teleopMissL4 ?? this.teleopMissL4,
      teleopAlgaeNet: teleopAlgaeNet ?? this.teleopAlgaeNet,
      teleopAlgaeProcessed:
      teleopAlgaeProcessed ?? this.teleopAlgaeProcessed,
      broke: broke ?? this.broke,
      penalties: penalties ?? this.penalties,

      endgameResult: endgameResult ?? this.endgameResult,
      createdAt: createdAt,
    );
  }
}