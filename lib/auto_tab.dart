import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_2027_project2/scouting_record_provider.dart';

enum AutoScoreField {
  coralL1,
  coralL2,
  coralL3,
  coralL4,
  algaeNet,
  algaeProcessed,
}

class AutoTab extends ConsumerWidget {
  const AutoTab({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoutingRecord = ref.watch(scoutingRecordProvider);

    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Text(
                      'Match: ${scoutingRecord?.matchNumber ?? '-'}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Text(
                      'Team: ${scoutingRecord?.teamNumber ?? '-'}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Text(
                      'Alliance: ${scoutingRecord?.alliancePosition.name ?? '-'}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ScoreBox(
                  title: 'Score L4',
                  field: AutoScoreField.coralL4,
                ),
              ),
              Expanded(
                child: ScoreBox(
                  title: 'Score L2',
                  field: AutoScoreField.coralL2,
                ),
              ),
            ],
          ),
        ),


        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ScoreBox(
                  title: 'Score L3',
                  field: AutoScoreField.coralL3,
                ),
              ),
              Expanded(
                child: ScoreBox(
                  title: 'Score L1',
                  field: AutoScoreField.coralL1,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ScoreBox(
                  title: 'Algae in Net',
                  field: AutoScoreField.algaeNet,
                ),
              ),
              Expanded(
                child: ScoreBox(
                  title: 'Algae Processed',
                  field: AutoScoreField.algaeProcessed,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
class ScoreBox extends ConsumerStatefulWidget {
  final String title;
  final AutoScoreField field;
  const ScoreBox({
    super.key,
    required this.title,
    required this.field,
  });
  @override
  ConsumerState<ScoreBox> createState() => _ScoreBoxState();
}

class _ScoreBoxState extends ConsumerState<ScoreBox> {
  void updateScore(int value) {
    final notifier = ref.read(scoutingRecordProvider.notifier);
    switch (widget.field) {
      case AutoScoreField.coralL1:
        notifier.updateAutoCoralL1(value);
        break;
      case AutoScoreField.coralL2:
        notifier.updateAutoCoralL2(value);
        break;

      case AutoScoreField.coralL3:
        notifier.updateAutoCoralL3(value);
        break;
      case AutoScoreField.coralL4:
        notifier.updateAutoCoralL4(value);
        break;
      case AutoScoreField.algaeNet:
        notifier.updateAutoAlgaeNet(value);
        break;
      case AutoScoreField.algaeProcessed:
        notifier.updateAutoAlgaeProcessed(value);
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    final scoutingRecord = ref.watch(scoutingRecordProvider);
    final displayedScore = switch (widget.field) {
      AutoScoreField.coralL1 => scoutingRecord?.autoCoralL1 ?? 0,
      AutoScoreField.coralL2 => scoutingRecord?.autoCoralL2 ?? 0,
      AutoScoreField.coralL3 => scoutingRecord?.autoCoralL3 ?? 0,
      AutoScoreField.coralL4 => scoutingRecord?.autoCoralL4 ?? 0,
      AutoScoreField.algaeNet => scoutingRecord?.autoAlgaeNet ?? 0,
      AutoScoreField.algaeProcessed =>
      scoutingRecord?.autoAlgaeProcessed ?? 0,
    };
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Column(
        children: [
          Text(widget.title, style: Theme.of(context).textTheme.titleMedium),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    if (displayedScore > 0) {
                      updateScore(displayedScore - 1);
                    }
                  },
                  icon: Icon(Icons.remove),
                ),
                Text(
                  '$displayedScore',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                IconButton(
                  onPressed: () {
                    updateScore(displayedScore + 1);
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
