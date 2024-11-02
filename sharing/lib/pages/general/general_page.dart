import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sharing/router/route.dart';
import 'package:sharing/shared/scaffold_builder.dart';

class GeneralPage extends StatelessWidget {
  const GeneralPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<GeneralRoute> items = GeneralRoute.values;

    return ScaffoldBuilder.title(
      appBarTitle: TabRoute.general.text.toUpperCase(),
      context: context,
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        itemCount: items.length,
        itemExtent: 60,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () => context.goNamed('text'),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      items[index].text,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
