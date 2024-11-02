import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sharing/pages/general_page.dart';
import 'package:sharing/pages/grid_page.dart';
import 'package:sharing/pages/list_page.dart';
import 'package:sharing/pages/scroll_page.dart';
import 'package:sharing/router/route.dart';
import 'package:sharing/bottom_navigation_wrapper.dart';

class AppRouter {
  static final AppRouter _shared = AppRouter._init();

  factory AppRouter() {
    return _shared;
  }

  static final GlobalKey<NavigatorState> _parentKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _generalKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _scrollKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _listKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _gridKey = GlobalKey<NavigatorState>();

  static late final GoRouter router;

  AppRouter._init() {
    router = GoRouter(
      navigatorKey: _parentKey,
      initialLocation: AppRoute.general.path,
      routes: routes,
    );
  }

  static StatefulShellRoute tabRoute() {
    return StatefulShellRoute.indexedStack(
      parentNavigatorKey: _parentKey,
      branches: [
        GoRoute(
          path: AppRoute.general.path,
          pageBuilder: (context, GoRouterState state) {
            return getPage(
              child: const GeneralPage(),
              state: state,
            );
          },
        ).toStatefulShellBranch(key: _generalKey),
        GoRoute(
          path: AppRoute.scroll.path,
          pageBuilder: (context, GoRouterState state) {
            return getPage(
              child: const ScrollPage(),
              state: state,
            );
          },
        ).toStatefulShellBranch(key: _scrollKey),
        GoRoute(
          path: AppRoute.list.path,
          pageBuilder: (context, GoRouterState state) {
            return getPage(
              child: const ListPage(),
              state: state,
            );
          },
        ).toStatefulShellBranch(key: _listKey),
        GoRoute(
          path: AppRoute.grid.path,
          pageBuilder: (context, GoRouterState state) {
            return getPage(
              child: const GridPage(),
              state: state,
            );
          },
        ).toStatefulShellBranch(key: _gridKey),
      ],
      pageBuilder: (context, state, shell) {
        return getPage(
          child: BottomNavigationWrapper(child: shell),
          state: state,
        );
      },
    );
  }

  static Page getPage({
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
