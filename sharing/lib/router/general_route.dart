import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sharing/pages/general/sub_pages/image_page.dart';
import 'package:sharing/pages/general/sub_pages/text_page.dart';
import 'package:sharing/pages/general/sub_pages/button_page.dart';

part 'general_route.g.dart';

final List<TypedGoRoute> generalRouteTypes = [
  textRouteType,
  imageRouteType,
  buttonRouteType,
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

/// Button
const buttonRouteType = TypedGoRoute<ButtonRoute>(path: '/button');

@immutable
@buttonRouteType
class ButtonRoute extends GoRouteData {
  const ButtonRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ButtonPage();
  }
}

/// Image
const imageRouteType = TypedGoRoute<ImageRoute>(path: '/image');

@immutable
@imageRouteType
class ImageRoute extends GoRouteData {
  const ImageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ImagePage();
  }
}