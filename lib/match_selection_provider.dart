import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedMatch extends Notifier<int?> {
  @override
  int? build() {
    return null;
  }
  void set(int? match) {
    state = match;
  }
}
final selectedMatchProvider = NotifierProvider<SelectedMatch, int?>(
  SelectedMatch.new,
);
