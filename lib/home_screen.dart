import 'package:flutter/material.dart';

void main() => runApp(const BearMetalScoutingApp());

class BearMetalScoutingApp extends StatelessWidget {
  const BearMetalScoutingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
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
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300, 100),
                ),
                onPressed: () {},
                child: const Text(
                  'Start Scouting',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300, 100),
                ),
                onPressed: () {},
                child: const Text(
                  'View Past Data',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300, 100),
                ),
                onPressed: () {},
                child: const Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Need Help'),
                      const Icon(
                        Icons.question_mark,
                        size: 20.0,
                      ),
                    ],
                ),
              ],
            ),
          ),
        );
    }
  }




