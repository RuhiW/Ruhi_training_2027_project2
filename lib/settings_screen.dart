import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          const SizedBox(height: 80),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Dark Mode', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(width: 20),
              const ThemeModeSetting(),
            ],
          ),
          const SizedBox(height: 30),

          ExpansionTile(
            title: Text('About', style: Theme.of(context).textTheme.titleLarge),
            children: const <Widget>[ListTile(title: Text('Blah blah'))],
          ),

          ExpansionTile(
            title: Text('Help', style: Theme.of(context).textTheme.titleLarge),
            children: const <Widget>[ListTile(title: Text('Inkllafa'))],
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

class ThemeModeSetting extends StatefulWidget {
  const ThemeModeSetting({super.key});

  @override
  State<ThemeModeSetting> createState() => _ThemeModeSettingState();
}

class _ThemeModeSettingState extends State<ThemeModeSetting> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: light,
      onChanged: (bool value) {
        setState(() {
          light = value;
        });
      },
    );
  }
}
