import 'package:flutter/material.dart';

enum TabRoute {
  general,
  scroll,
  list,
  grid,
}

extension Tab on TabRoute {
  String get path => '/${toString().split('.').last}';
  String get text => toString().split('.').last.capitalizeFirstLetter() ?? '';

  IconData get unselectedIcon {
    return Icons.check_circle_outline;
  }

  IconData get selectedIcon {
    return Icons.check_circle;
  }
}

enum GeneralRoute {
  text,
  image,
  button,
  gesture,
  row,
  column,
  stack,
  card,
  textField,
}

extension General on GeneralRoute {
  String get path => '/${toString().split('.').last}';
  String get text => toString().split('.').last.capitalizeFirstLetter() ?? '';
}

extension Capitalize on String {
  String capitalizeFirstLetter() {
    final input = this;

    if (input.isEmpty) {
      return input;
    }

    return input[0].toUpperCase() + input.substring(1);
  }
}