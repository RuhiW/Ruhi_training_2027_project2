import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:training_2027_project2/models.dart';
import 'package:training_2027_project2/alliance.dart';

import 'provider_helpers.dart';

class Teams extends AsyncNotifier<List<Team>> {
  @override
  Future<List<Team>> build() async {
    final selectedEvent = ref.watch(selectedEventProvider);
    final apiKey = ref.watch(tbaApiKeyProvider);

    if (selectedEvent == null) {
      return [];
    }

    final url = Uri.https(
      'www.thebluealliance.com',
      '/api/v3/event/$selectedEvent/teams',
    );

    final response = await http.get(url, headers: {'X-TBA-Auth-Key': apiKey});

    if (response.statusCode != 200) {
      throw Exception('Failed to load teams: ${response.statusCode}');
    }

    final List<dynamic> data = jsonDecode(response.body);

    return data.map((team) => Team.fromJson(team)).toList();
  }
}

final teamsProvider = AsyncNotifierProvider<Teams, List<Team>>(Teams.new);
