import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sharing/router/route.dart';

class BottomNavigationWrapper extends StatefulWidget {
  const BottomNavigationWrapper({
    super.key,
    required this.child,
  });

  final StatefulNavigationShell child;

  @override
  State<BottomNavigationWrapper> createState() =>
      _BottomNavigationWrapperState();
}

class _BottomNavigationWrapperState extends State<BottomNavigationWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widget.child,
      ),
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
        items: AppRoute.values
            .map((e) => BottomNavigationBarItem(
                  icon: Icon(e.unselectedIcon),
                  label: e.text,
                ))
            .toList(),
      ),
    );
  }
}
