import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_2027_project2/scouting_record_provider.dart';
import 'package:training_2027_project2/classes.dart';

class EndgameTab extends ConsumerStatefulWidget {
  const EndgameTab({super.key});
  @override
  ConsumerState<EndgameTab> createState() => _EndgameTabState();
}

class _EndgameTabState extends ConsumerState<EndgameTab> {
  @override
  Widget build(BuildContext context) {
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
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Select Final Result',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  const SizedBox(height: 35),
                  Material(
                    color: Colors.transparent,
                    child: RadioGroup<EndgameResult>(
                      groupValue: scoutingRecord?.endgameResult,
                      onChanged: (value) {
                        if (value != null) {
                          ref.read(scoutingRecordProvider.notifier)
                              .updateEndgameResult(value);
                        }
                      },
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio<EndgameResult>(value: EndgameResult.noScore),
                              Text(
                                'No Endgame Score',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio<EndgameResult>(value: EndgameResult.parked),
                              Text(
                                'Parked',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio<EndgameResult>(value: EndgameResult.shallowCage),
                              Text(
                                'Shallow Cage',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio<EndgameResult>(value: EndgameResult.deepCage),
                              Text(
                                'Deep Cage',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      final record = ref.read(scoutingRecordProvider);

                      if (record != null) {
                        ref.read(savedRecordsProvider.notifier).saveRecord(record);
                        context.go('/');
                      }
                    },
                    child: const Text('Save and Quit'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
