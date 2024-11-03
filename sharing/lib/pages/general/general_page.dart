import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sharing/router/general_route.dart';
import 'package:sharing/router/router.dart';
import 'package:sharing/router/tab_route.dart';
import 'package:sharing/shared/scaffold_builder.dart';

class GeneralPage extends StatelessWidget {
  const GeneralPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<TypedGoRoute> items = generalRouteTypes;

    return ScaffoldBuilder.title(
      appBarTitle: 'General',
      context: context,
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        itemCount: items.length,
        itemExtent: 60,
        itemBuilder: (ctx, index) {
          final item = items[index];

          return GestureDetector(
            onTap: () => ctx.push('${generalRouteType.path}${item.path}'),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      items[index].title,
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
