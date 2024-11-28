import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sharing/pages/scroll/sub_pages/carousel_view_page.dart';
import 'package:sharing/pages/scroll/sub_pages/custom_scroll_view_page.dart';
import 'package:sharing/pages/scroll/sub_pages/list_page.dart';
import 'package:sharing/pages/scroll/sub_pages/tab_bar_view_page/default_tab_controller_page.dart';
import 'package:sharing/pages/scroll/sub_pages/tab_bar_view_page/tab_bar_view_page.dart';
import 'package:sharing/pages/scroll/sub_pages/grid_page.dart';
import 'package:sharing/pages/scroll/sub_pages/page_view_page.dart';
import 'package:sharing/pages/scroll/sub_pages/single_scroll_view_page.dart';

part 'scroll_route.g.dart';

const List<TypedGoRoute> scrollRouteTypes = [
  singleScrollViewRouteType,
  listRouteType,
  gridRouteType,
  pageViewRouteType,
  tabBarViewRouteType,
  customScrollViewRouteType,
  carouselViewRouteType,
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
const tabBarViewRouteType =
    TypedGoRoute<TabBarViewRoute>(path: '/tab_bar_view');

@immutable
@tabBarViewRouteType
class TabBarViewRoute extends GoRouteData {
  const TabBarViewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TabBarViewPage();
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
    return const DefaultTabControllerViewPage();
  }
}

/// custom scroll view
const customScrollViewRouteType =
    TypedGoRoute<CustomScrollViewRoute>(path: '/custom_scroll_view');

@immutable
@customScrollViewRouteType
class CustomScrollViewRoute extends GoRouteData {
  const CustomScrollViewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CustomScrollViewPage();
  }
}
