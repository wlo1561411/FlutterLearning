import 'package:flutter/material.dart';

class ScaffoldBuilder {
  static Scaffold title({
    String appBarTitle = '',
    required BuildContext context,
    required Widget body,
  }) {
    return Scaffold(
      appBar: appBarTitle.isNotEmpty
          ? AppBar(
        title: Text(
          appBarTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      )
          : null,
      body: body,
    );
  }
}
