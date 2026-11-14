import 'package:flutter/material.dart';
import 'app_theme.dart';

enum Alliance {red, blue}

class SelectedAlliance extends StatefulWidget {
  const SelectedAlliance({super.key});

  @override
  State<SelectedAlliance> createState() => _SelectedAllianceState();
}
class _SelectedAllianceState extends State<SelectedAlliance>{
  Alliance selectedAlliance = Alliance.red;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Alliance>(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          Theme.of(context).textTheme.titleLarge,
        ),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(
          horizontal:70,
          vertical: 20,
        ),
      ),
      minimumSize: const WidgetStatePropertyAll(
        Size (400,70),
        ),
      ),
      segments: const <ButtonSegment<Alliance>>[
        ButtonSegment<Alliance>(
          value: Alliance.red,
          label: Text('Red'),
        ),
        ButtonSegment<Alliance>(
          value: Alliance.blue,
          label: Text('Blue'),
        ),
      ],
      selected: {selectedAlliance},
      onSelectionChanged: (Set<Alliance> newSelection) {
        setState(() {
          selectedAlliance = newSelection.first;
        });
      },
    );
  }
}

class MatchSelectionScreen extends StatelessWidget {
  const MatchSelectionScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Text(
            'SCOUTING SETUP',
            style: Theme.of(context).textTheme.displayLarge,

        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 35,

            children: [

              SizedBox(
                width: 300,
                height: 70,
                child: TextField(
                  expands: true,
                  maxLines: null,
                  minLines: null,
                  decoration: InputDecoration(
                  labelText: 'Match Number',
                  labelStyle: const TextStyle(
                    fontSize: 22,
                  ),
                  hintText: 'Enter the match number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.number,
                ),
              ),
              SizedBox (
                width: 300,
                height: 70,
                child: DropdownButton(
                  borderRadius: BorderRadius.circular(15),
                  isExpanded: true,
                  hint: const Text (
                    'Select a team',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  items: const [
                  DropdownMenuItem(child: Text('2046'), value: '2046'),
                  DropdownMenuItem(child: Text('1910'), value: '1910')
                ],
                onChanged: null,
                ),
              ),
              const SelectedAlliance(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300, 70),
                ),
                onPressed: () {},
                child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}