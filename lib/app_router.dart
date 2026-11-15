import 'package:go_router/go_router.dart';
import 'home_screen.dart';
import 'past_data.dart';
import 'settings_screen.dart';
import 'scouting_screen.dart';
import 'match_selection_screen.dart';
import 'home_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => SettingsScreen(),
    ),
    GoRoute(
      path: '/past-data',
      builder: (context, state) => PastData(),
    ),
    GoRoute(
      path: '/scouting-screen',
      builder: (context, state) => ScoutingScreen(),
    ),GoRoute(
      path: '/match-selection-screen',
      builder: (context, state) => MatchSelectionScreen(),
    ),
  ],
);
