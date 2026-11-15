import 'package:flutter/material.dart';

class TeleopTab extends StatelessWidget {
  const TeleopTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
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
                Expanded(
                  child: TeleopScoreBox(title: 'Score L4'),
                ),
                Expanded(
                  child: TeleopScoreBox(title: 'Miss for L4'),
                ),
                Expanded(
                  child: TeleopScoreBox(title: 'Algae Processed'),
                ),
              ],
            ),
          ),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: TeleopScoreBox(title: 'Score L3'),
                ),
                Expanded(
                  child: TeleopScoreBox(title: 'Miss for L3'),
                ),
                Expanded(
                  child: TeleopScoreBox(title: 'Algae in Net'),
                ),
              ],
            ),
          ),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: TeleopScoreBox(title: 'Score L2'),
                ),
                Expanded(
                  child: TeleopScoreBox(title: 'Miss for L2'),
                ),
                Expanded(
                  child: BrokeBox(),
                ),
              ],
            ),
          ),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: TeleopScoreBox(title: 'Score L1'),
                ),
                Expanded(
                  child: TeleopScoreBox(title: 'Miss for L1'),
                ),
                Expanded(
                  child: TeleopScoreBox(title: 'Penalties'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TeleopScoreBox extends StatefulWidget {
  final String title;

  const TeleopScoreBox({
    super.key,
    required this.title,
  });

  @override
  State<TeleopScoreBox> createState() => _TeleopScoreBoxState();
}

class _TeleopScoreBoxState extends State<TeleopScoreBox> {
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),

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

                Text(
                  '$score',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),

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

class BrokeBox extends StatefulWidget {
  const BrokeBox({super.key});

  @override
  State<BrokeBox> createState() => _BrokeBoxState();
}

class _BrokeBoxState extends State<BrokeBox> {
  bool? broke;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: [
          Text(
            'Broke?',
            style: Theme.of(context).textTheme.titleMedium,
          ),

          Expanded(
            child: Material(
              color: Colors.transparent,
              child: RadioGroup<bool>(
                groupValue: broke,
                onChanged: (value) {
                  setState(() {
                    broke = value;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio<bool>(value: true),
                        Text('Yes'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio<bool>(value: false),
                        Text('No'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}