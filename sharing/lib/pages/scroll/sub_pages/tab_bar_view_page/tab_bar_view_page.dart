import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sharing/router/router.dart';
import 'package:sharing/router/scroll_route.dart';
import 'package:sharing/shared/item_selector_page.dart';
import 'package:sharing/router/tab_route.dart';

class TabBarViewPage extends StatelessWidget {
  TabBarViewPage({super.key});

  final List<TypedGoRoute> _routes = tabBarViewRouteType.goRoutes;

  @override
  Widget build(BuildContext context) {
    return ItemSelectorPage(
      title: 'TabBarView',
      items: _routes.map((e) => e.title).toList(),
      onItemTap: (index) {
        context.push('${scrollRouteType.path}${tabBarViewRouteType.path}${_routes[index].path}');
      },
    );
  }
}
