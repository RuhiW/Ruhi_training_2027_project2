import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const BearMetalScoutingApp());
class BearMetalScoutingApp extends StatelessWidget {
  const BearMetalScoutingApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Text(
          'WELCOME TO BEAR METAL SCOUTING',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 16,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: const Size(300, 100)),
              onPressed: () {
                context.go('/match-selection-screen');
              },
              child: const Text(
                'Start Scouting',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: const Size(300, 100)),
              onPressed: () {
                context.go('/past-data');
              },
              child: const Text(
                'View Past Data',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: const Size(300, 100)),
              onPressed: () {
                context.go('/settings');
              },
              child: const Text(
                'Settings',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {
                    showDialog<void>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('How to Use Bear Metal Scouting'),
                        content: const SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome!',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'The Bear Metal Scouting App helps you collect and view '
                                    'robot performance data.',
                              ),
                              SizedBox(height: 12),
                              Text(
                                '1. Preparing to scout',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Select an event, enter a match number and choose '
                                    'your alliance position. The app will automatically '
                                    'identify the team you are scouting.',
                              ),
                              SizedBox(height: 12),

                              Text(
                                '2. Record Performance',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'There are three tabs to help you record robot performance:',
                              ),
                              Text('- Auto: Autonomous period.'),
                              Text('- Teleop: Teleoperated period.'),
                              Text('- Endgame: Endgame performance.'),
                              SizedBox(height: 12),
                              Text(
                                '3. Save Your Data',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'When you are finished, click Save and Quit in the Endgame tab to save '
                                    'the scouting record.',
                              ),
                              SizedBox(height: 12),
                              Text(
                                '4. View Past Data',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Return to the home screen and select View Past Data '
                                    'to view  records and you can filter them by event, '
                                    'match number, and team.',
                              ),
                              SizedBox(height: 12),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Got it!'),
                          ),
                        ],
                      ),
                    );
                  },
                  label: const Text('Need Help'),
                  icon: const Icon(Icons.question_mark, size: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
