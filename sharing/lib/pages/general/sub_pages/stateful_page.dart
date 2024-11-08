import 'package:flutter/material.dart';
import 'package:sharing/shared/scaffold_builder.dart';

/// Source
/// https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html
class StatefulPage extends StatefulWidget {
  const StatefulPage({super.key});

  @override
  State<StatefulPage> createState() => _StatefulPage();
}

class _StatefulPage extends State<StatefulPage> with ScaffoldBuilder {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    print('StatefulPage building');

    return scaffold(
      appBarTitle: 'Stateful',
      context: context,
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Count: $_count',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
