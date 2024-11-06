import 'package:flutter/material.dart';

mixin TitleBuilder {
  Widget title(BuildContext context, String text,
      {Color color = Colors.white}) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: color),
      ),
    );
  }
}
