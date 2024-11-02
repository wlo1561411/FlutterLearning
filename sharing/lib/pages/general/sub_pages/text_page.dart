import 'package:flutter/material.dart';
import 'package:sharing/router/route.dart';
import 'package:sharing/shared/scaffold_builder.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBuilder.title(
      appBarTitle: GeneralRoute.text.text,
      context: context,
      body: Placeholder(),
    );
  }
}
