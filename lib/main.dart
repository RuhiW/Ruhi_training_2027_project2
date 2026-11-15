import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_2027_project2/endgame_tab.dart';
import 'package:training_2027_project2/past_data.dart';
import 'package:training_2027_project2/teleop_tab.dart';
import 'home_screen.dart';
import 'app_theme.dart';
import 'match_selection_screen.dart';
import 'scouting_screen.dart';
import 'settings_screen.dart';
import 'auto_tab.dart';
import 'app_router.dart';

void main() {
  runApp(
    ProviderScope(
      child: BearMetalScoutingApp(),
    ),
  );
}

class BearMetalScoutingApp extends StatelessWidget {
  const BearMetalScoutingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}