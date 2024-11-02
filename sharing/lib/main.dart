import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sharing/router/router.dart';

void main() {
  AppRouter();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
    );
  }
}
