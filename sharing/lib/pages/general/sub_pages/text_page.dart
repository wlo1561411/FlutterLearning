import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sharing/shared/scaffold_builder.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouter.of(context).routeInformationProvider.value.uri.path;
    print(currentLocation);

    return ScaffoldBuilder.title(
      appBarTitle: 'Text',
      context: context,
      body: Placeholder(),
    );
  }
}
