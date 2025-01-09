import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sharing/router/general_route.dart';
import 'package:sharing/router/router.dart';
import 'package:sharing/router/tab_route.dart';
import 'package:sharing/shared/item_selector_page.dart';

class GeneralPage extends StatelessWidget {
  const GeneralPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<TypedGoRoute> items = generalRouteTypes;

    return ItemSelectorPage(
      title: 'General',
      items: items.map((e) => e.title).toList(),
      onItemTap: (index) {
        context.push('${generalRouteType.path}${items[index].path}');
      },
    );
  }
}
