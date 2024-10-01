import 'package:character_selector/theme.dart';
import 'package:flutter/material.dart';
import 'home/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      theme: primaryTheme,
      home: const Home(),
    ),
  ));
}
