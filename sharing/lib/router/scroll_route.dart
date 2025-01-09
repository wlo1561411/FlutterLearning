import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sharing/pages/scroll/sub_pages/carousel_view_page.dart';
import 'package:sharing/pages/scroll/sub_pages/custom_scroll_view_page/custom_scroll_view_page.dart';
import 'package:sharing/pages/scroll/sub_pages/custom_scroll_view_page/layout_builder/custom_scroll_view_layout_builder_page.dart';
import 'package:sharing/pages/scroll/sub_pages/custom_scroll_view_page/overview/custom_scroll_view_overview_page.dart';
import 'package:sharing/pages/scroll/sub_pages/custom_scroll_view_page/persistent_header/custom_scroll_view_persistent_header_page.dart';
import 'package:sharing/pages/scroll/sub_pages/list_page.dart';
import 'package:sharing/pages/scroll/sub_pages/tab_bar_view_page/default_tab_controller/default_tab_controller_page.dart';
import 'package:sharing/pages/scroll/sub_pages/tab_bar_view_page/tab_bar_view_page.dart';
import 'package:sharing/pages/scroll/sub_pages/grid_page.dart';
import 'package:sharing/pages/scroll/sub_pages/page_view_page.dart';
import 'package:sharing/pages/scroll/sub_pages/single_scroll_view_page.dart';
import 'package:sharing/pages/scroll/sub_pages/tab_bar_view_page/tab_controller/tab_controller_page.dart';

part 'scroll_route.g.dart';

const List<TypedGoRoute> scrollRouteTypes = [
  singleScrollViewRouteType,
  listRouteType,
  gridRouteType,
  pageViewRouteType,
  carouselViewRouteType,
  tabBarViewRouteType,
  customScrollViewRouteType,
];

/// single scroll view
const singleScrollViewRouteType =
    TypedGoRoute<SingleScrollViewRoute>(path: '/single_scroll_view');

@immutable
@singleScrollViewRouteType
class SingleScrollViewRoute extends GoRouteData {
  const SingleScrollViewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SingleScrollViewPage();
  }
}

/// list
const listRouteType = TypedGoRoute<ListRoute>(path: '/list');

@immutable
@listRouteType
class ListRoute extends GoRouteData {
  const ListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ListPage();
  }
}

/// grid
const gridRouteType = TypedGoRoute<GridRoute>(path: '/grid');

@immutable
@gridRouteType
class GridRoute extends GoRouteData {
  const GridRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const GridPage();
  }
}

/// page view
const pageViewRouteType = TypedGoRoute<PageViewRoute>(path: '/page_view');

@immutable
@pageViewRouteType
class PageViewRoute extends GoRouteData {
  const PageViewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PageViewPage();
  }
}

/// CarouselView
const carouselViewRouteType =
    TypedGoRoute<CarouselViewRoute>(path: '/carousel_view');

@immutable
@carouselViewRouteType
class CarouselViewRoute extends GoRouteData {
  const CarouselViewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CarouselViewPage();
  }
}

/// tab bar view
const tabBarViewRouteType = TypedGoRoute<TabBarViewRoute>(
  path: '/tab_bar_view',
  routes: [
    defaultTabControllerRouteType,
    tabControllerRouteType,
  ],
);

@immutable
@tabBarViewRouteType
class TabBarViewRoute extends GoRouteData {
  const TabBarViewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TabBarViewPage();
  }
}

/// default tab controller
const defaultTabControllerRouteType =
    TypedGoRoute<DefaultTabControllerRoute>(path: '/default_tab_controller');

@immutable
@defaultTabControllerRouteType
class DefaultTabControllerRoute extends GoRouteData {
  const DefaultTabControllerRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DefaultTabControllerPage();
  }
}

/// tab controller
const tabControllerRouteType =
    TypedGoRoute<TabControllerRoute>(path: '/tab_controller');

@immutable
@tabControllerRouteType
class TabControllerRoute extends GoRouteData {
  const TabControllerRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TabControllerPage();
  }
}

/// custom scroll view
const customScrollViewRouteType = TypedGoRoute<CustomScrollViewRoute>(
  path: '/custom_scroll_view',
  routes: [
    customScrollViewOverviewRouteType,
    customScrollViewPersistentHeaderRouteType,
    customScrollViewLayoutBuilderRouteType,
  ],
);

@immutable
@customScrollViewRouteType
class CustomScrollViewRoute extends GoRouteData {
  const CustomScrollViewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CustomScrollViewPage();
  }
}

/// custom scroll view overview
const customScrollViewOverviewRouteType =
    TypedGoRoute<CustomScrollViewOverviewRoute>(
        path: '/custom_scroll_view_overview');

@immutable
@customScrollViewOverviewRouteType
class CustomScrollViewOverviewRoute extends GoRouteData {
  const CustomScrollViewOverviewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CustomScrollViewOverviewPage();
  }
}

/// custom scroll view persistent header
const customScrollViewPersistentHeaderRouteType =
    TypedGoRoute<CustomScrollViewPersistentHeaderRoute>(
        path: '/custom_scroll_view_persistent_header');

@immutable
@customScrollViewPersistentHeaderRouteType
class CustomScrollViewPersistentHeaderRoute extends GoRouteData {
  const CustomScrollViewPersistentHeaderRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CustomScrollViewPersistentHeaderPage();
  }
}

/// custom scroll view layout builder
const customScrollViewLayoutBuilderRouteType =
    TypedGoRoute<CustomScrollViewLayoutBuilderRoute>(
        path: '/custom_scroll_view_layout_builder');

@immutable
@customScrollViewLayoutBuilderRouteType
class CustomScrollViewLayoutBuilderRoute extends GoRouteData {
  const CustomScrollViewLayoutBuilderRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CustomScrollViewLayoutBuilderPage();
  }
}
