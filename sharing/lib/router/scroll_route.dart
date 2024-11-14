import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sharing/pages/scroll/sub_pages/carousel_view_page.dart';

part 'scroll_route.g.dart';

final List<TypedGoRoute> scrollRouteTypes = [
  carouselViewRouteType,
];

/// CarouselView
const carouselViewRouteType = TypedGoRoute<CarouselViewRoute>(path: '/carousel_view');

@immutable
@carouselViewRouteType
class CarouselViewRoute extends GoRouteData {
  const CarouselViewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CarouselViewPage();
  }
}