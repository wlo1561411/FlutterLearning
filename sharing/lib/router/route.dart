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
    switch (this) {
      case AppRoute.general:
        return Icons.filter_1_outlined;
      case AppRoute.scroll:
        return Icons.filter_2_outlined;
      case AppRoute.list:
        return Icons.filter_3_outlined;
      case AppRoute.grid:
        return Icons.filter_4_outlined;
    }
  }
}

final routes = [
  AppRouter.tabRoute(),
];