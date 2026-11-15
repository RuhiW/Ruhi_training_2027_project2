import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AlliancePosition { red1, red2, red3, blue1, blue2, blue3 }

class SelectedAlliancePosition extends Notifier<AlliancePosition?> {
  @override
  AlliancePosition? build() {
    return null;
  }

  void set(AlliancePosition? alliancePosition) {
    state = alliancePosition;
  }
}

class SelectedEvent extends Notifier<String?> {
  @override
  String? build() {
    return null;
  }

  void set(String? event) {
    state = event;
  }
}

final selectedEventProvider = NotifierProvider<SelectedEvent, String?>(
  SelectedEvent.new,
);
final selectedPositionProvider =
    NotifierProvider<SelectedAlliancePosition, AlliancePosition?>(
      SelectedAlliancePosition.new,
    );
