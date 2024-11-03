import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sharing/router/tab_route.dart';

final _routes = [
  ...tabShellRoutes,
];

class AppRouterConfiguration {
  static final GlobalKey<NavigatorState> _parentKey =
      GlobalKey<NavigatorState>();

  GoRouter getRouter() {
    return GoRouter(
      navigatorKey: _parentKey,
      initialLocation: const GeneralRoute().location,
      routes: _routes,
    );
  }
}

extension TypedGoRouteInfo on TypedGoRoute {
  String get title => path.replaceFirstMapped('/', (s) => '').capitalizeFirstLetter();
}

extension Capitalize on String {
  String capitalizeFirstLetter() {
    final input = this;

    if (input.isEmpty) {
      return input;
    }

    return input[0].toUpperCase() + input.substring(1);
  }
}
