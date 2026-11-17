import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_2027_project2/theme_provider.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          const SizedBox(height: 80),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Dark Mode',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(width: 20),
                const ThemeModeSetting(),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ExpansionTile(
              title: Text('About', style: Theme.of(context).textTheme.titleLarge),
              children: const <Widget>[
                ListTile(
                  title: Text(
                    'Bear Metal Scouting is a scouting app that helps with '
                        'the collection and organization of competition data. '
                        'It was designed to support scouting and strategic analysis. '
                        'The application provides access to event, team, and match '
                        'information through integration with The Blue Alliance (TBA). '
                        'Built using Flutter and Dart, the app aims to make scouting '
                        'more efficient and organized.',
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/');
            },
            child: const Text('Go Home'),
          ),
        ],
      ),
    );
  }
}
class ThemeModeSetting extends ConsumerWidget {
  const ThemeModeSetting({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return Switch(
      value: themeMode == ThemeMode.dark,
      onChanged: (bool value) {
        ref.read(themeModeProvider.notifier).setThemeMode(
          value ? ThemeMode.dark : ThemeMode.light,
        );
      },
    );
  }
}