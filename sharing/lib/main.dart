import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sharing/router/router.dart';
import 'package:sharing/theme.dart';

late GoRouter _router;

void main() {
  _router = AppRouterConfiguration().getRouter();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: primaryTheme,
      darkTheme: primaryTheme,
      routerConfig: _router,
    );
  }
}
