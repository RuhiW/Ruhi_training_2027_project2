import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_2027_project2/classes.dart';
import 'package:training_2027_project2/alliance.dart';

class ScoutingRecordNotifier extends Notifier<ScoutingRecord?> {
  @override
  ScoutingRecord? build() {
    return null;
  }
  void updateEndgameResult(EndgameResult value) {
    if (state == null) return;
    state = state!.copyWith(endgameResult: value);
  }
  void updateBroke(bool value) {
    if (state == null) return;
    state = state!.copyWith(broke: value);
  }
  void startRecord({
    required String eventKey,
    required int matchNumber,
    required int teamNumber,
    required AlliancePosition alliancePosition,
  }) {
    state = ScoutingRecord(
      eventKey: eventKey,
      matchNumber: matchNumber,
      teamNumber: teamNumber,
      alliancePosition: alliancePosition,
    );
  }
  void updatePenalties(int value) {
    if (state == null) return;
    state = state!.copyWith(penalties: value);
  }
  void updateAutoCoralL4(int value) {
    if (state == null) return;
    state = state!.copyWith(
      autoCoralL4: value,
    );
  }

  void updateAutoCoralL1(int value) {
    if (state == null) return;
    state = state!.copyWith(autoCoralL1: value);
  }
  void updateAutoCoralL2(int value) {
    if (state == null) return;
    state = state!.copyWith(autoCoralL2: value);
  }
  void updateAutoCoralL3(int value) {
    if (state == null) return;
    state = state!.copyWith(autoCoralL3: value);
  }
  void updateAutoAlgaeNet(int value) {
    if (state == null) return;
    state = state!.copyWith(autoAlgaeNet: value);
  }
  void updateAutoAlgaeProcessed(int value) {
    if (state == null) return;
    state = state!.copyWith(autoAlgaeProcessed: value);
  }
  void updateTeleopCoralL1(int value) {
    if (state == null) return;
    state = state!.copyWith(teleopCoralL1: value);
  }
  void updateTeleopCoralL2(int value) {
    if (state == null) return;
    state = state!.copyWith(teleopCoralL2: value);
  }
  void updateTeleopCoralL3(int value) {
    if (state == null) return;
    state = state!.copyWith(teleopCoralL3: value);
  }
  void updateTeleopCoralL4(int value) {
    if (state == null) return;
    state = state!.copyWith(teleopCoralL4: value);
  }
  void updateTeleopMissL1(int value) {
    if (state == null) return;
    state = state!.copyWith(teleopMissL1: value);
  }
  void updateTeleopMissL2(int value) {
    if (state == null) return;
    state = state!.copyWith(teleopMissL2: value);
  }
  void updateTeleopMissL3(int value) {
    if (state == null) return;
    state = state!.copyWith(teleopMissL3: value);
  }
  void updateTeleopMissL4(int value) {
    if (state == null) return;
    state = state!.copyWith(teleopMissL4: value);
  }
  void updateTeleopAlgaeNet(int value) {
    if (state == null) return;
    state = state!.copyWith(teleopAlgaeNet: value);
  }
  void updateTeleopAlgaeProcessed(int value) {
    if (state == null) return;
    state = state!.copyWith(teleopAlgaeProcessed: value);
  }
}
final scoutingRecordProvider =
NotifierProvider<ScoutingRecordNotifier, ScoutingRecord?>(
  ScoutingRecordNotifier.new,
);
class SavedRecordsNotifier extends Notifier<List<ScoutingRecord>> {
  @override
  List<ScoutingRecord> build() {
    return [];
  }
  void saveRecord(ScoutingRecord record) {
    state = [...state, record];
  }
}
final savedRecordsProvider =
NotifierProvider<SavedRecordsNotifier, List<ScoutingRecord>>(
  SavedRecordsNotifier.new,
);