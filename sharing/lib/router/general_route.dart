import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sharing/pages/general/sub_pages/align_page.dart';
import 'package:sharing/pages/general/sub_pages/image_page.dart';
import 'package:sharing/pages/general/sub_pages/stack_page.dart';
import 'package:sharing/pages/general/sub_pages/stateful_restraint_page.dart';
import 'package:sharing/pages/general/sub_pages/text_page.dart';
import 'package:sharing/pages/general/sub_pages/button_page.dart';
import 'package:sharing/pages/general/sub_pages/stateful_page.dart';
import 'package:sharing/pages/general/sub_pages/row_page.dart';
import 'package:sharing/pages/general/sub_pages/column_page.dart';
import 'package:sharing/pages/general/sub_pages/value_listenable_builder_page.dart';
import 'package:sharing/pages/general/sub_pages/text_field_page/text_field_page.dart';

part 'general_route.g.dart';

const List<TypedGoRoute> generalRouteTypes = [
  textRouteType,
  imageRouteType,
  buttonRouteType,
  rowRouteType,
  columnRouteType,
  stackRouteType,
  alignRouteType,
  statefulRouteType,
  statefulRestraintRouteType,
  valueListenableBuilderRouteType,
  textFieldRouteType,
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

/// Row
const rowRouteType = TypedGoRoute<RowRoute>(path: '/row');

@immutable
@rowRouteType
class RowRoute extends GoRouteData {
  const RowRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RowPage();
  }
}

/// Column
const columnRouteType = TypedGoRoute<ColumnRoute>(path: '/column');

@immutable
@columnRouteType
class ColumnRoute extends GoRouteData {
  const ColumnRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ColumnPage();
  }
}

/// Align
const alignRouteType = TypedGoRoute<AlignRoute>(path: '/align');

@immutable
@alignRouteType
class AlignRoute extends GoRouteData {
  const AlignRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AlignPage();
  }
}

/// Stack
const stackRouteType = TypedGoRoute<StackRoute>(path: '/stack');

@immutable
@stackRouteType
class StackRoute extends GoRouteData {
  const StackRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const StackPage();
  }
}

/// Stateful
const statefulRouteType = TypedGoRoute<StatefulRoute>(path: '/stateful');

@immutable
@statefulRouteType
class StatefulRoute extends GoRouteData {
  const StatefulRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const StatefulPage();
  }
}

/// Stateful Restraint
const statefulRestraintRouteType = TypedGoRoute<StatefulRestraintRoute>(path: '/stateful_restraint');

@immutable
@statefulRestraintRouteType
class StatefulRestraintRoute extends GoRouteData {
  const StatefulRestraintRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const StatefulRestraintPage();
  }
}

/// ValueListenableBuilder
const valueListenableBuilderRouteType = TypedGoRoute<ValueListenableBuilderRoute>(path: '/value_listenable_builder');

@immutable
@valueListenableBuilderRouteType
class ValueListenableBuilderRoute extends GoRouteData {
  const ValueListenableBuilderRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ValueListenableBuilderPage();
  }
}

/// TextField
const textFieldRouteType = TypedGoRoute<TextFieldRoute>(path: '/text_field');

@immutable
@textFieldRouteType
class TextFieldRoute extends GoRouteData {
  const TextFieldRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TextFieldPage();
  }
}