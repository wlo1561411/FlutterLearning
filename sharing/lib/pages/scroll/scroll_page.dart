import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sharing/router/router.dart';
import 'package:sharing/router/scroll_route.dart';
import 'package:sharing/shared/scaffold_builder.dart';
import 'package:sharing/router/tab_route.dart';

class ScrollPage extends StatelessWidget with ScaffoldBuilder {
  const ScrollPage({super.key});

  @override
  Widget build(BuildContext context) {
    return scaffold(
      appBarTitle: 'Scroll',
      context: context,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
              _card(context, carouselViewRouteType),
          ],
        ),
      ),
    );
  }

  Widget _card(BuildContext context, TypedGoRoute route) {
    return GestureDetector(
      onTap: () => context.push('${scrollRouteType.path}${route.path}'),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                route.title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}