import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sharing/pages/general/sub_pages/text_page.dart';

part 'general_route.g.dart';

final List<TypedGoRoute> generalRouteTypes = [
  textRouteType
];

/// Text
const textRouteType = TypedGoRoute<TextRoute>(path: '/text');

@immutable
@textRouteType
class TextRoute extends GoRouteData {
  const TextRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TextPage();
  }
}