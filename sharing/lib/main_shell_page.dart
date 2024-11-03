import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sharing/router/router.dart';

class MainShellPage extends StatefulWidget {
  const MainShellPage({
    super.key,
    required this.tabRouteTypes,
    required this.child,
  });

  final List<TypedGoRoute> tabRouteTypes;
  final StatefulNavigationShell child;

  @override
  State<MainShellPage> createState() =>
      _MainShellPageState();
}

class _MainShellPageState extends State<MainShellPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.child.currentIndex,
        onTap: (index) {
          widget.child.goBranch(
            index,
            initialLocation: index == widget.child.currentIndex,
          );
          setState(() {});
        },
        items: widget.tabRouteTypes
            .map((e) => BottomNavigationBarItem(
                  icon: const Icon(Icons.circle_outlined),
                  activeIcon: const Icon(Icons.check_circle),
                  label: e.title,
                ))
            .toList(),
      ),
    );
  }
}
