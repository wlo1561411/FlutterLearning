import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sharing/main_shell_page.dart';
import 'package:sharing/pages/general/general_page.dart';
import 'package:sharing/pages/grid_page.dart';
import 'package:sharing/pages/list_page.dart';
import 'package:sharing/pages/scroll_page.dart';
import 'package:sharing/router/general_route.dart';

part 'tab_route.g.dart';

List<RouteBase> tabShellRoutes = $appRoutes;

final List<TypedGoRoute> tabRouteTypes = [
  gridRouteType,
  scrollRouteType,
  listRouteType,
  gridRouteType,
];

/// shell
@immutable
@TypedStatefulShellRoute<MainShellRouteData>(
  branches: [
    TypedStatefulShellBranch<GeneralShellBranchData>(
      routes: [generalRouteType],
    ),
    TypedStatefulShellBranch<ScrollShellBranchData>(
      routes: [scrollRouteType],
    ),
    TypedStatefulShellBranch<ListShellBranchData>(
      routes: [listRouteType],
    ),
    TypedStatefulShellBranch<GridShellBranchData>(
      routes: [gridRouteType],
    ),
  ],
)
class MainShellRouteData extends StatefulShellRouteData {
  const MainShellRouteData();

  @override
  Page<void> pageBuilder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return MaterialPage(
      key: state.pageKey,
      child: MainShellPage(
        tabRouteTypes: tabRouteTypes,
        child: navigationShell,
      ),
    );
  }
}

/// general
final GlobalKey<NavigatorState> _generalKey = GlobalKey<NavigatorState>();
const generalRouteType = TypedGoRoute<GeneralRoute>(
  path: '/general',
  routes: [
    textRouteType,
  ],
);

class GeneralShellBranchData extends StatefulShellBranchData {
  const GeneralShellBranchData();

  static final GlobalKey<NavigatorState> $navigatorKey = _generalKey;
}

class GeneralRoute extends GoRouteData {
  const GeneralRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const GeneralPage();
  }
}

/// scroll
final GlobalKey<NavigatorState> _scrollKey = GlobalKey<NavigatorState>();
const scrollRouteType = TypedGoRoute<ScrollRoute>(path: '/scroll');

class ScrollShellBranchData extends StatefulShellBranchData {
  const ScrollShellBranchData();

  static final GlobalKey<NavigatorState> $navigatorKey = _scrollKey;
}

class ScrollRoute extends GoRouteData {
  const ScrollRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ScrollPage();
  }
}

/// list
final GlobalKey<NavigatorState> _listKey = GlobalKey<NavigatorState>();
const listRouteType = TypedGoRoute<ListRoute>(path: '/list');

class ListShellBranchData extends StatefulShellBranchData {
  const ListShellBranchData();

  static final GlobalKey<NavigatorState> $navigatorKey = _listKey;
}

class ListRoute extends GoRouteData {
  const ListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ListPage();
  }
}

/// grid
final GlobalKey<NavigatorState> _gridKey = GlobalKey<NavigatorState>();
const gridRouteType = TypedGoRoute<GridRoute>(path: '/grid');

class GridShellBranchData extends StatefulShellBranchData {
  const GridShellBranchData();

  static final GlobalKey<NavigatorState> $navigatorKey = _gridKey;
}

class GridRoute extends GoRouteData {
  const GridRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const GridPage();
  }
}
