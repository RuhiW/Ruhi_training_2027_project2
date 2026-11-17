import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_2027_project2/theme_provider.dart';

import 'app_theme.dart';
import 'app_router.dart';

void main() {
  runApp(ProviderScope(child: BearMetalScoutingApp()));
}

class BearMetalScoutingApp extends ConsumerWidget {
  const BearMetalScoutingApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp.router(
      routerConfig: router,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
    );
  }
}
