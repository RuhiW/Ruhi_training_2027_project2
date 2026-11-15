import 'package:flutter/material.dart';

class AutoTab extends StatelessWidget {
  const AutoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Text(
                      'Box 1',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Text(
                      'Box 2',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Text(
                      'Box 3',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: Row(
            children: [
              Expanded(child: ScoreBox(title: 'Score L4')),
              Expanded(child: ScoreBox(title: 'Score L2')),
            ],
          ),
        ),

        Expanded(
          child: Row(
            children: [
              Expanded(child: ScoreBox(title: 'Score L4')),
              Expanded(child: ScoreBox(title: 'Score L1')),
            ],
          ),
        ),

        Expanded(
          child: Row(
            children: [
              Expanded(child: ScoreBox(title: 'Algae in Net')),
              Expanded(child: ScoreBox(title: 'Algae Processed')),
            ],
          ),
        ),
      ],
    );
  }
}

class ScoreBox extends StatefulWidget {
  final String title;

  const ScoreBox({super.key, required this.title});

  @override
  State<ScoreBox> createState() => _ScoreBoxState();
}

class _ScoreBoxState extends State<ScoreBox> {
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Column(
        children: [
          Text(widget.title, style: Theme.of(context).textTheme.titleMedium),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (score > 0) {
                        score--;
                      }
                    });
                  },
                  icon: Icon(Icons.remove),
                ),

                Text('$score', style: Theme.of(context).textTheme.bodyLarge),

                IconButton(
                  onPressed: () {
                    setState(() {
                      score++;
                    });
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
