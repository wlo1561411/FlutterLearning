import 'package:flutter/material.dart';

mixin ScaffoldBuilder {
  Scaffold scaffold({
    String appBarTitle = '',
    Color? backgroundColor,
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
      backgroundColor: backgroundColor,
      body: body,
    );
  }
}
