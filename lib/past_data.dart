import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_2027_project2/scouting_record_provider.dart';
class PastData extends ConsumerStatefulWidget {
  const PastData({super.key});
  @override
  ConsumerState<PastData> createState() => _PastDataState();
}
class _PastDataState extends ConsumerState<PastData> {
  String? selectedEventKey;
  String selectedMatchFilter = 'All Matches';
  String selectedTeamFilter = 'All Teams';
  @override
  Widget build(BuildContext context) {
    final savedRecords = ref.watch(savedRecordsProvider);
    final eventKeys = savedRecords
        .map((record) => record.eventKey)
        .toSet()
        .toList();
    final currentEventKey = selectedEventKey ??
        (eventKeys.isNotEmpty ? eventKeys.first : null);
    final eventRecords = savedRecords
        .where((record) => record.eventKey == currentEventKey)
        .toList();
    final matchNumbers = eventRecords
        .map((record) => record.matchNumber)
        .toSet()
        .toList()
      ..sort();
    final teamNumbers = eventRecords
        .map((record) => record.teamNumber)
        .toSet()
        .toList()
      ..sort();
    final filteredRecords = eventRecords.where((record) {
      final matchesMatch = selectedMatchFilter == 'All Matches' ||
          record.matchNumber.toString() == selectedMatchFilter;

      final matchesTeam = selectedTeamFilter == 'All Teams' ||
          record.teamNumber.toString() == selectedTeamFilter;
      return matchesMatch && matchesTeam;
    }).toList();
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Scouting Database')),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.go('/');
                },
                child: Text('Go Home'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Text(
                  'Filter By:',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Event:', style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(width: 15),
                  DropdownButton<String>(
                    value: currentEventKey,
                    hint: const Text('No saved events'),
                    items: eventKeys.map((eventKey) {
                      String eventName = eventKey;

                      if (eventKey == '2025wasno') {
                        eventName = 'Glacier Peak 2025';
                      } else if (eventKey == '2025wabon') {
                        eventName = 'Bonney Lake 2025';
                      }
                      return DropdownMenuItem(
                        value: eventKey,
                        child: Text(eventName),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedEventKey = value;
                        selectedMatchFilter = 'All Matches';
                        selectedTeamFilter = 'All Teams';
                      });
                    },
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Match:', style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(width: 15),
                  DropdownButton<String>(
                    value: selectedMatchFilter,
                    items: [
                      const DropdownMenuItem(
                        value: 'All Matches',
                        child: Text('All Matches'),
                      ),
                      ...matchNumbers.map((matchNumber) {
                        return DropdownMenuItem(
                          value: matchNumber.toString(),
                          child: Text('Match $matchNumber'),
                        );
                      }),
                    ],
                    onChanged: (value) {
                      if (value == null) return;

                      setState(() {
                        selectedMatchFilter = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Team:', style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(width: 15),
                  DropdownButton<String>(
                    value: selectedTeamFilter,
                    items: [
                      const DropdownMenuItem(
                        value: 'All Teams',
                        child: Text('All Teams'),
                      ),
                      ...teamNumbers.map((teamNumber) {
                        return DropdownMenuItem(
                          value: teamNumber.toString(),
                          child: Text('Team $teamNumber'),
                        );
                      }),
                    ],
                    onChanged: (value) {
                      if (value == null) return;

                      setState(() {
                        selectedTeamFilter = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: filteredRecords.isEmpty
                  ? Center(
                child: Text(
                  currentEventKey == null
                      ? 'No saved records yet. Start scouting to add some!'
                      : 'No saved records for this event yet.',
                ),
              )
                  : ListView.builder(
                itemCount: filteredRecords.length,
                itemBuilder: (context, index) {
                  final record = filteredRecords[index];

                  return Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 650),
                      child: Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Team ${record.teamNumber}',
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Match ${record.matchNumber} • '
                                    '${record.alliancePosition.name}',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),

                              const Divider(height: 30),
                              Text(
                                'AUTO',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 10),
                              Text('Coral L1: ${record.autoCoralL1}'),
                              Text('Coral L2: ${record.autoCoralL2}'),
                              Text('Coral L3: ${record.autoCoralL3}'),
                              Text('Coral L4: ${record.autoCoralL4}'),
                              Text('Algae in Net: ${record.autoAlgaeNet}'),
                              Text('Algae Processed: ${record.autoAlgaeProcessed}'),
                              const Divider(height: 30),
                              Text(
                                'TELEOP',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 10),
                              Text('Coral L1 Scored: ${record.teleopCoralL1}'),
                              Text('Coral L2 Scored: ${record.teleopCoralL2}'),
                              Text('Coral L3 Scored: ${record.teleopCoralL3}'),
                              Text('Coral L4 Scored: ${record.teleopCoralL4}'),
                              Text('Coral L1 Missed: ${record.teleopMissL1}'),
                              Text('Coral L2 Missed: ${record.teleopMissL2}'),
                              Text('Coral L3 Missed: ${record.teleopMissL3}'),
                              Text('Coral L4 Missed: ${record.teleopMissL4}'),
                              Text('Algae in Net: ${record.teleopAlgaeNet}'),
                              Text('Algae Processed: ${record.teleopAlgaeProcessed}'),
                              Text('Penalties: ${record.penalties}'),
                              const Divider(height: 30),
                              Text(
                                'ENDGAME',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Broke: ${record.broke == null ? 'Not recorded' : record.broke! ? 'Yes' : 'No'}',
                              ),
                              Text(
                                'Endgame Result: ${record.endgameResult?.name ?? 'Not recorded'}',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
