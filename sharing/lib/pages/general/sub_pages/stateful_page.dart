import 'package:flutter/material.dart';
import 'package:sharing/shared/scaffold_builder.dart';

class StatefulPage extends StatelessWidget with ScaffoldBuilder {
  const StatefulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return scaffold(
      appBarTitle: 'Stateful',
      context: context,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          ],
        ),
      ),
    );  }
}
