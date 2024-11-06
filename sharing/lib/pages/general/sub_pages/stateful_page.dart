import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharing/shared/scaffold_builder.dart';

class StatefulPage extends StatefulWidget {
  const StatefulPage({super.key});

  @override
  State<StatefulPage> createState() => _StatefulPage();
}

class _StatefulPage extends State<StatefulPage> with ScaffoldBuilder {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  bool isSwitched = false;

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('StatefulPage building');

    return scaffold(
      appBarTitle: 'Stateful',
      context: context,
      body: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isSwitched)
                  ValueListenableBuilder<int>(
                    valueListenable: _counter,
                    builder: (ctx, count, child) {
                      print('Current Count Text building');
                      return Text(
                        'ValueListenableBuilder\nCurrent Count: $count',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 24),
                      );
                    },
                  )
                else
                  Text(
                    'Current Count: ${_counter.value}',
                    style: const TextStyle(fontSize: 24),
                  ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Text('Increment'),
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: Column(
              children: [
                const Text('Switch'),
                CupertinoSwitch(
                  value: isSwitched,
                  onChanged: (isSwitched) {
                    setState(() {
                      this.isSwitched = isSwitched;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _incrementCounter() {
    if (isSwitched) {
      _counter.value++;
    } else {
      setState(() {
        _counter.value++;
      });
    }
  }
}
