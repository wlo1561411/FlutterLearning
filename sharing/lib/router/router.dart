import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sharing/pages/general/general_page.dart';
import 'package:sharing/pages/general/sub_pages/text_page.dart';
import 'package:sharing/pages/grid_page.dart';
import 'package:sharing/pages/list_page.dart';
import 'package:sharing/pages/scroll_page.dart';
import 'package:sharing/router/route.dart';
import 'package:sharing/bottom_navigation_wrapper.dart';

final _routes = [
  AppRouterConfiguration.tabRoute(),
];

class AppRouterConfiguration {
  static final GlobalKey<NavigatorState> _parentKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _generalKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _scrollKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _listKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _gridKey = GlobalKey<NavigatorState>();

  GoRouter getRouter() {
    return GoRouter(
      navigatorKey: _parentKey,
      initialLocation: TabRoute.general.path,
      routes: _routes,
    );
  }

  static StatefulShellRoute tabRoute() {
    return StatefulShellRoute.indexedStack(
      parentNavigatorKey: _parentKey,
      branches: [
        GoRoute(
          path: TabRoute.general.path,
          pageBuilder: (context, GoRouterState state) {
            return _getTabPage(
              child: const GeneralPage(),
              state: state,
            );
          },
        ).toStatefulShellBranch(key: _generalKey),
        GoRoute(
          path: TabRoute.scroll.path,
          pageBuilder: (context, GoRouterState state) {
            return _getTabPage(
              child: const ScrollPage(),
              state: state,
            );
          },
        ).toStatefulShellBranch(key: _scrollKey),
        GoRoute(
          path: TabRoute.list.path,
          pageBuilder: (context, GoRouterState state) {
            return _getTabPage(
              child: const ListPage(),
              state: state,
            );
          },
        ).toStatefulShellBranch(key: _listKey),
        GoRoute(
          path: TabRoute.grid.path,
          pageBuilder: (context, GoRouterState state) {
            return _getTabPage(
              child: const GridPage(),
              state: state,
            );
          },
        ).toStatefulShellBranch(key: _gridKey),
      ],
      pageBuilder: (context, state, shell) {
        return _getTabPage(
          child: BottomNavigationWrapper(child: shell),
          state: state,
        );
      },
    );
  }

  static Page _getTabPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}

extension _Wrap on GoRoute {
  StatefulShellBranch toStatefulShellBranch(
      {required GlobalKey<NavigatorState> key}) {
    return StatefulShellBranch(
      navigatorKey: key,
      routes: [this],
    );
  }
}
