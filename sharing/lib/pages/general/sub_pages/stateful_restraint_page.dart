import 'package:flutter/material.dart';
import 'package:sharing/shared/scaffold_builder.dart';

class StatefulRestraintPage extends StatefulWidget {
  const StatefulRestraintPage({super.key});

  @override
  State<StatefulRestraintPage> createState() => _StatefulRestraintPage();
}

class _StatefulRestraintPage extends State<StatefulRestraintPage>
    with ScaffoldBuilder {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    print('StatefulRestraintPage building');

    return scaffold(
      appBarTitle: 'Stateful Restraint',
      context: context,
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CounterDisplayWidget(),
        ],
      )
    );
  }
}

class CounterDisplayWidget extends StatefulWidget {
  const CounterDisplayWidget({super.key});

  @override
  State<CounterDisplayWidget> createState() => _CounterDisplayState();
}

class _CounterDisplayState extends State<CounterDisplayWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    print('CounterDisplayWidget building');

    return Column(
      children: [
        Text(
          'Current Count: $_counter',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
          child: const Text('Increment'),
        ),
      ],
    );
  }
}
