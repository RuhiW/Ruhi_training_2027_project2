import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EndgameTab extends StatefulWidget {
  const EndgameTab({super.key});

  @override
  State<EndgameTab> createState() => _EndgameTabState();
}

class _EndgameTabState extends State<EndgameTab> {
  String? finalResult;

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
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Select Final Result',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  const SizedBox(height: 35),

                  Material(
                    color: Colors.transparent,
                    child: RadioGroup<String>(
                      groupValue: finalResult,
                      onChanged: (value) {
                        setState(() {
                          finalResult = value;
                        });
                      },
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio<String>(value: 'No Endgame Score'),
                              Text(
                                  'No Endgame Score',
                                  style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio<String>(value: 'Parked'),
                              Text(
                                  'Parked',
                                  style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio<String>(value: 'Shallow Cage'),
                              Text(
                                  'Shallow Cage',
                                  style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio<String>(value: 'Deep Cage'),
                              Text(
                                  'Deep Cage',
                                  style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  ElevatedButton(
                    onPressed: () {
                      context.go('/');
                    },
                    child: Text('Save and Quit'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}