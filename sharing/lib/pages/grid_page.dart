import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sharing/bottom_navigation_wrapper.dart';

class GridPage extends StatelessWidget {
  const GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed('text'),
      child: Center(
        child: Text('Grid Page'),
      ),
    );
  }
}