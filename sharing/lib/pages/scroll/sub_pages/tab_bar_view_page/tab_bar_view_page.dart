import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sharing/router/router.dart';
import 'package:sharing/router/scroll_route.dart';
import 'package:sharing/shared/scaffold_builder.dart';
import 'package:sharing/router/tab_route.dart';
import 'package:sharing/theme.dart';

class TabBarViewPage extends StatelessWidget with ScaffoldBuilder {
  const TabBarViewPage({super.key});

  final List<TypedGoRoute> _routes = const [
    defaultTabControllerRouteType,
  ];

  @override
  Widget build(BuildContext context) {
    return scaffold(
      appBarTitle: 'TabBarView',
      context: context,
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemExtent: 50,
        itemCount: _routes.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            dense: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            tileColor: AppColors.secondaryColor.withValues(alpha: 0.5),
            splashColor: Colors.transparent,
            title: Text(_routes[index].title, style: Theme.of(context).textTheme.bodyMedium,),
            onTap: () => context.push('${scrollRouteType.path}${_routes[index].path}'),
          );
        },
      ),
    );
  }
}
