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
  String get title => path.convertToCamelCase();
}

extension _Capitalize on String {
  String convertToCamelCase() {
    return replaceFirstMapped('/', (s) => '').split('_').map((word) {
      if (word.isEmpty) return '';
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join('');
  }
}

extension TypedRouteInfo on TypedRoute {
  List<TypedGoRoute> get goRoutes =>
      (this as TypedGoRoute?)?.routes.whereType<TypedGoRoute>().toList() ?? [];
}