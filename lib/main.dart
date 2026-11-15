import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_theme.dart';
import 'app_router.dart';

void main() {
  runApp(ProviderScope(child: BearMetalScoutingApp()));
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
