import 'package:flutter/material.dart';
import 'package:sharing/shared/scaffold_builder.dart';

class NestedScrollViewPage extends StatelessWidget with ScaffoldBuilder {
  const NestedScrollViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return scaffold(
      appBarTitle: 'NestedScrollView',
      context: context,
      body: Placeholder(),
    );
  }
}
