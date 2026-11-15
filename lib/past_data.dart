import 'package:flutter/material.dart';

class PastData extends StatelessWidget {
  const PastData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Scouting Database'),
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Text(
                  'Filter By:',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Match:',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(width: 15),
                  DropdownButton<String>(
                    value: 'All Matches',
                    items: [
                      DropdownMenuItem(
                        value: 'All Matches',
                        child: Text('All Matches'),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Team:',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(width: 15),
                  DropdownButton<String>(
                    value: 'All Teams',
                    items: [
                      DropdownMenuItem(
                        value: 'All Teams',
                        child: Text('All Teams'),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}