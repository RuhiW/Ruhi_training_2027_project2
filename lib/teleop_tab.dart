import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_2027_project2/scouting_record_provider.dart';
enum TeleopScoreField {
  coralL1,
  coralL2,
  coralL3,
  coralL4,
  missL1,
  missL2,
  missL3,
  missL4,
  algaeNet,
  algaeProcessed,
  penalties,
}
class TeleopTab extends ConsumerWidget {
  const TeleopTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoutingRecord = ref.watch(scoutingRecordProvider);
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
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
                  child: TeleopScoreBox(
                    title: 'Score L4',
                    field: TeleopScoreField.coralL4,
                  ),
                ),
                Expanded(
                  child: TeleopScoreBox(
                    title: 'Miss for L4',
                    field: TeleopScoreField.missL4,
                  ),
                ),
                Expanded(
                  child: TeleopScoreBox(
                    title: 'Algae Processed',
                    field: TeleopScoreField.algaeProcessed,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: TeleopScoreBox(
                    title: 'Score L3',
                    field: TeleopScoreField.coralL3,
                  ),
                ),
                Expanded(
                  child: TeleopScoreBox(
                    title: 'Miss for L3',
                    field: TeleopScoreField.missL3,
                  ),
                ),
                Expanded(
                  child: TeleopScoreBox(
                    title: 'Algae In Net',
                    field: TeleopScoreField.algaeNet,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: TeleopScoreBox(
                    title: 'Score L2',
                    field: TeleopScoreField.coralL2,
                  ),
                ),
                Expanded(
                  child: TeleopScoreBox(
                    title: 'Miss for L2',
                    field: TeleopScoreField.missL2,
                  ),
                ),
                Expanded(child: BrokeBox()),
              ],
            ),
          ),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: TeleopScoreBox(
                    title: 'Score L1',
                    field: TeleopScoreField.coralL1,
                  ),
                ),
                Expanded(
                  child: TeleopScoreBox(
                    title: 'Miss for L1',
                    field: TeleopScoreField.missL1,
                  ),
                ),
                Expanded(
                  child: TeleopScoreBox(
                    title: 'Penalties',
                    field: TeleopScoreField.penalties,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class TeleopScoreBox extends ConsumerStatefulWidget {
  final String title;
  final TeleopScoreField field;

  const TeleopScoreBox({
    super.key,
    required this.title,
    required this.field,
  });

  @override
  ConsumerState<TeleopScoreBox> createState() => _TeleopScoreBoxState();
}

class _TeleopScoreBoxState extends ConsumerState<TeleopScoreBox> {
  void updateScore(int value) {
    final notifier = ref.read(scoutingRecordProvider.notifier);
    switch (widget.field) {
      case TeleopScoreField.coralL1:
        notifier.updateTeleopCoralL1(value);
        break;
      case TeleopScoreField.coralL2:
        notifier.updateTeleopCoralL2(value);
        break;
      case TeleopScoreField.coralL3:
        notifier.updateTeleopCoralL3(value);
        break;
      case TeleopScoreField.coralL4:
        notifier.updateTeleopCoralL4(value);
        break;
      case TeleopScoreField.missL1:
        notifier.updateTeleopMissL1(value);
        break;
      case TeleopScoreField.missL2:
        notifier.updateTeleopMissL2(value);
        break;
      case TeleopScoreField.missL3:
        notifier.updateTeleopMissL3(value);
        break;
      case TeleopScoreField.missL4:
        notifier.updateTeleopMissL4(value);
        break;
      case TeleopScoreField.algaeNet:
        notifier.updateTeleopAlgaeNet(value);
        break;
      case TeleopScoreField.algaeProcessed:
        notifier.updateTeleopAlgaeProcessed(value);
        break;
      case TeleopScoreField.penalties:
        notifier.updatePenalties(value);
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    final scoutingRecord = ref.watch(scoutingRecordProvider);

    final displayedScore = switch (widget.field) {
      TeleopScoreField.coralL1 => scoutingRecord?.teleopCoralL1 ?? 0,
      TeleopScoreField.coralL2 => scoutingRecord?.teleopCoralL2 ?? 0,
      TeleopScoreField.coralL3 => scoutingRecord?.teleopCoralL3 ?? 0,
      TeleopScoreField.coralL4 => scoutingRecord?.teleopCoralL4 ?? 0,
      TeleopScoreField.missL1 => scoutingRecord?.teleopMissL1 ?? 0,
      TeleopScoreField.missL2 => scoutingRecord?.teleopMissL2 ?? 0,
      TeleopScoreField.missL3 => scoutingRecord?.teleopMissL3 ?? 0,
      TeleopScoreField.missL4 => scoutingRecord?.teleopMissL4 ?? 0,
      TeleopScoreField.algaeNet => scoutingRecord?.teleopAlgaeNet ?? 0,
      TeleopScoreField.algaeProcessed =>
      scoutingRecord?.teleopAlgaeProcessed ?? 0,
      TeleopScoreField.penalties => scoutingRecord?.penalties ?? 0,
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
                  onPressed: displayedScore > 0
                      ? () {
                    updateScore(displayedScore - 1);
                  }
                      : null,
                  icon: const Icon(Icons.remove),
                ),
                Text(
                  '$displayedScore',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                IconButton(
                  onPressed: () {
                    updateScore(displayedScore + 1);
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class BrokeBox extends ConsumerStatefulWidget {
  const BrokeBox({super.key});

  @override
  ConsumerState<BrokeBox> createState() => _BrokeBoxState();
}
class _BrokeBoxState extends ConsumerState<BrokeBox> {
  @override
  Widget build(BuildContext context) {
    final scoutingRecord = ref.watch(scoutingRecordProvider);
    final broke = scoutingRecord?.broke;
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Column(
        children: [
          Text('Broke?', style: Theme.of(context).textTheme.titleMedium),
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: RadioGroup<bool>(
                groupValue: broke,
                onChanged: (value) {
                  if (value != null) {
                    ref.read(scoutingRecordProvider.notifier).updateBroke(value);
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Radio<bool>(value: true), Text('Yes')],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Radio<bool>(value: false), Text('No')],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
