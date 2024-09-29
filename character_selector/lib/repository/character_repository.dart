import 'package:flutter/material.dart';
import '../models/character.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CharacterRepository extends ChangeNotifier {
  List<Character> _characters = [];

  CharacterRepository() {
    _loadFromLocal();
  }

  void post(Character character) {
    _characters.add(character);
    notifyListeners();
    _saveToLocal();
  }

  List<Character> get() {
    return _characters;
  }

  void put(Character updatedCharacter) {
    final index = _characters.indexWhere((character) => character.id == updatedCharacter.id);

    if (index != -1) {
      _characters[index] = updatedCharacter;
      notifyListeners();
      _saveToLocal();
    }
  }

  Future<void> _loadFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final String? charactersJson = prefs.getString('characters');

    if (charactersJson != null) {
      List<dynamic> charactersMap = jsonDecode(charactersJson);
      _characters = charactersMap.map((json) => Character.fromJson(json)).toList();
    }

    notifyListeners();
  }

  Future<void> _saveToLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final String charactersJson = jsonEncode(_characters.map((c) => c.toJson()).toList());
    await prefs.setString('characters', charactersJson);
  }
}

