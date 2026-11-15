import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:training_2027_project2/models.dart';
import 'package:training_2027_project2/alliance.dart';

import 'provider_helpers.dart';

class Matches extends AsyncNotifier<List<Match>> {
  @override
  Future<List<Match>> build() async {
    final selectedEvent = ref.watch(selectedEventProvider);
    final apiKey = ref.watch(tbaApiKeyProvider);

    if (selectedEvent == null) {
      return [];
    }
    final url = Uri.https(
      'www.thebluealliance.com',
      '/api/v3/event/$selectedEvent/matches',
    );

    final response = await http.get(url, headers: {'X-TBA-Auth-Key': apiKey});

    if (response.statusCode != 200) {
      throw Exception('Failed to load matches: ${response.statusCode}');
    }
    final List<dynamic> data = jsonDecode(response.body);
    final qualificationMatches = data
        .where((match) => match['comp_level'] == 'qm')
        .toList();
    return qualificationMatches.map((match) => Match.fromJson(match)).toList();
  }
}

final matchesProvider = AsyncNotifierProvider<Matches, List<Match>>(
  Matches.new,
);
