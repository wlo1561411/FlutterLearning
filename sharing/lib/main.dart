import 'package:flutter/material.dart';
import 'package:sharing/router/router.dart';
import 'package:sharing/theme.dart';

void main() {
  AppRouter();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: primaryTheme,
      darkTheme: primaryTheme,
      routerConfig: AppRouter.router,
    );
  }
}
