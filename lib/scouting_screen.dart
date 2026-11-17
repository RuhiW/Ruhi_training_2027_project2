import 'package:flutter/material.dart';
import 'package:training_2027_project2/teleop_tab.dart';
import 'auto_tab.dart';
import 'endgame_tab.dart';
class ScoutingScreen extends StatefulWidget {
  const ScoutingScreen({super.key});
  @override
  State<ScoutingScreen> createState() => _MyTabbedPageState();
}
class _MyTabbedPageState extends State<ScoutingScreen>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Auto'),
    Tab(text: 'Teleop'),
    Tab(text: 'Endgame'),
  ];

  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          labelStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          controller: _tabController,
          tabs: myTabs,
        ),
        title: const Text('Scouting'),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [AutoTab(), TeleopTab(), EndgameTab()],
      ),
    );
  }
}
