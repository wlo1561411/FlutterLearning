import 'package:character_selector/repository/character_repository.dart';
import 'package:character_selector/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home/home.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CharacterRepository(),
    child: MaterialApp(
      theme: primaryTheme,
      home: const Home(),
    ),
  ));
}
