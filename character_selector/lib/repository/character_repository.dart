import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/character.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

part 'character_repository.g.dart';

@riverpod
class CharacterRepository extends _$CharacterRepository {
  @override
  List<Character> build() {
    return const [];
  }

  CharacterRepository() {
    _loadFromLocal();
  }

  void post(Character character) {
    if (!state.contains(character)) {
      state = [...state, character];
      _saveToLocal();
    }
  }

  void delete(Character character) {
    if (state.contains(character)) {
      state = state.where((c) => c.id != character.id).toList();
      _saveToLocal();
    }
  }

  void put(Character updatedCharacter) {
    final index =
        state.indexWhere((character) => character.id == updatedCharacter.id);

    if (index != -1) {
      List<Character> updated = state;
      state[index] = updatedCharacter;
      state = updated;
      _saveToLocal();
    }
  }

  Future<void> _loadFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final String? charactersJson = prefs.getString('characters');

    if (charactersJson != null) {
      List<dynamic> charactersMap = jsonDecode(charactersJson);
      state = charactersMap.map((json) => Character.fromJson(json)).toList();
    }
  }

  Future<void> _saveToLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final String charactersJson =
        jsonEncode(state.map((c) => c.toJson()).toList());
    await prefs.setString('characters', charactersJson);
  }
}
