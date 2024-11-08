import 'package:flutter/material.dart';
import 'package:sharing/shared/scaffold_builder.dart';

/// Source
/// https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html
class ValueListenableBuilderPage extends StatefulWidget {
  const ValueListenableBuilderPage({super.key});

  @override
  State<ValueListenableBuilderPage> createState() =>
      _ValueListenableBuilderPage();
}

class _ValueListenableBuilderPage extends State<ValueListenableBuilderPage>
    with ScaffoldBuilder {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('ValueListenableBuilderPage building');

    return scaffold(
      appBarTitle: 'ValueListenableBuilder',
      context: context,
      body: FractionallySizedBox(
        widthFactor: 1,
        child: ValueListenableBuilder(
          valueListenable: _counter,
          builder: (ctx, count, child) {
            print('Current Count Text building');

            if (child == null) return const SizedBox.shrink();

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Current Count: $count',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24),
                ),
                child,
              ],
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: () {
                _counter.value++;
              },
              child: const Text('Increment'),
            ),
          ),
        ),
      ),
    );
  }
}
