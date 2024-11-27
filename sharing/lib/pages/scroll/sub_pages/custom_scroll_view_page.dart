import 'package:flutter/material.dart';
import 'package:sharing/shared/scaffold_builder.dart';

class CustomScrollViewPage extends StatelessWidget with ScaffoldBuilder {
  const CustomScrollViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return scaffold(
      appBarTitle: 'CustomScrollView',
      context: context,
      body: Placeholder(),
    );
  }
}
