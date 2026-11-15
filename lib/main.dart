import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'home_screen.dart';
import 'app_theme.dart';
import 'match_selection_screen.dart';
import 'scouting_screen.dart';
import 'settings_screen.dart';

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
    return MaterialApp(
      home: const HomeScreen(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}