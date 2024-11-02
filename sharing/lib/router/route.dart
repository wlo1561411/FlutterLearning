import 'package:flutter/material.dart';
import 'package:sharing/router/router.dart';

enum AppRoute {
  general,
  scroll,
  list,
  grid,
}

extension Path on AppRoute {
  String get path => '/$text';

  String get text {
    switch (this) {
      case AppRoute.general:
        return 'general';
      case AppRoute.scroll:
        return 'scroll';
      case AppRoute.list:
        return 'list';
      case AppRoute.grid:
        return 'grid';
    }
  }

  IconData get unselectedIcon {
    return Icons.check_circle_outline;
  }

  IconData get selectedIcon {
    return Icons.check_circle;
  }
}

final routes = [
  AppRouter.tabRoute(),
];