import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_2027_project2/Providers/match_selection_provider.dart';

import 'alliance.dart';

import 'package:training_2027_project2/Providers/teams_provider.dart';
import 'package:training_2027_project2/Providers/matches_provider.dart';

class SelectedAlliance extends ConsumerWidget {
  const SelectedAlliance({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPosition = ref.watch(selectedPositionProvider);

    return SegmentedButton<AlliancePosition>(
      emptySelectionAllowed: true,
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          Theme.of(context).textTheme.titleLarge,
        ),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        ),
        minimumSize: const WidgetStatePropertyAll(Size(400, 70)),
      ),
      segments: const [
        ButtonSegment(value: AlliancePosition.red1, label: Text('R1')),
        ButtonSegment(value: AlliancePosition.red2, label: Text('R2')),
        ButtonSegment(value: AlliancePosition.red3, label: Text('R3')),
        ButtonSegment(value: AlliancePosition.blue1, label: Text('B1')),
        ButtonSegment(value: AlliancePosition.blue2, label: Text('B2')),
        ButtonSegment(value: AlliancePosition.blue3, label: Text('B3')),
      ],
      selected: selectedPosition == null ? {} : {selectedPosition},
      onSelectionChanged: (Set<AlliancePosition> newSelection) {
        ref
            .read(selectedPositionProvider.notifier)
            .set(newSelection.isEmpty ? null : newSelection.first);
      },
    );
  }
}

class MatchSelectionScreen extends ConsumerWidget {
  const MatchSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchesAsync = ref.watch(matchesProvider);
    final selectedMatch = ref.watch(selectedMatchProvider);
    final selectedPosition = ref.watch(selectedPositionProvider);
    final teamsAsync = ref.watch(teamsProvider);
    if (matchesAsync.isLoading || teamsAsync.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (matchesAsync.hasError || teamsAsync.hasError) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Unable to load TBA data.'),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  ref.invalidate(matchesProvider);
                  ref.invalidate(teamsProvider);
                },
                child: const Text('Try Again'),
              ),
            ],
          ),
        ),
      );
    }
    final allMatches = matchesAsync.asData?.value ?? [];

    final matchingMatches = allMatches
        .where((match) => match.matchNumber == selectedMatch)
        .toList();

    final selectedMatchData = matchingMatches.isEmpty
        ? null
        : matchingMatches.first;
    final selectedTeamKey =
        selectedMatchData == null || selectedPosition == null
        ? null
        : switch (selectedPosition) {
            AlliancePosition.red1 => selectedMatchData.redTeamKeys[0],
            AlliancePosition.red2 => selectedMatchData.redTeamKeys[1],
            AlliancePosition.red3 => selectedMatchData.redTeamKeys[2],
            AlliancePosition.blue1 => selectedMatchData.blueTeamKeys[0],
            AlliancePosition.blue2 => selectedMatchData.blueTeamKeys[1],
            AlliancePosition.blue3 => selectedMatchData.blueTeamKeys[2],
          };
    final allTeams = teamsAsync.asData?.value ?? [];
    final matchingTeams = allTeams
        .where((team) => 'frc${team.teamNumber}' == selectedTeamKey)
        .toList();

    final selectedTeam = matchingTeams.isEmpty ? null : matchingTeams.first;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Text(
          'SCOUTING SETUP',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 35,

          children: [
            SizedBox(
              width: 300,
              height: 70,
              child: TextField(
                onChanged: (value) {
                  ref
                      .read(selectedMatchProvider.notifier)
                      .set(int.tryParse(value));
                },
                expands: true,
                maxLines: null,
                minLines: null,
                decoration: InputDecoration(
                  labelText: 'Match Number',
                  labelStyle: const TextStyle(fontSize: 22),
                  hintText: 'Enter the match number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              width: 300,
              height: 70,
              child: DropdownButton<String>(
                borderRadius: BorderRadius.circular(15),
                isExpanded: true,

                hint: const Text(
                  'Select an event',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),

                value: ref.watch(selectedEventProvider),

                items: const [
                  DropdownMenuItem(
                    value: '2025wasno',
                    child: Text('Glacier Peak 2025'),
                  ),
                  DropdownMenuItem(
                    value: '2025wabon',
                    child: Text('Bonney Lake 2025'),
                  ),
                ],

                onChanged: (String? event) {
                  ref.read(selectedEventProvider.notifier).set(event);
                },
              ),
            ),
            SizedBox(
              width: 300,
              height: 70,

              child: DropdownButton<int>(
                borderRadius: BorderRadius.circular(15),
                isExpanded: true,

                hint: const Text(
                  'Select a team',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),

                value: selectedTeam?.teamNumber,

                items: allTeams.map((team) {
                  return DropdownMenuItem<int>(
                    value: team.teamNumber,
                    child: Text('${team.teamNumber} - ${team.teamName}'),
                  );
                }).toList(),

                onChanged: null,
              ),
            ),
            const SelectedAlliance(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: const Size(300, 70)),
              onPressed: () {
                final match = ref.read(selectedMatchProvider);
                final event = ref.read(selectedEventProvider);
                final position = ref.read(selectedPositionProvider);

                if (match == null ||
                    match <= 0 ||
                    event == null ||
                    position == null ||
                    selectedTeam == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Please complete all selections before continuing.',
                      ),
                    ),
                  );

                  return;
                }

                context.go('/scouting-screen');
              },

              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
