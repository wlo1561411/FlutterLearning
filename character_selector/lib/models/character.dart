import 'package:character_selector/models/skill.dart';
import 'package:character_selector/models/stats.dart';
import 'package:character_selector/models/vocation.dart';

class Character with Stats {
  Character({
    required this.id,
    required this.name,
    required this.slogan,
    required this.vocation,
  });

  final String id;
  final String name;
  final String slogan;
  final Vocation vocation;
  final Set<Skill> skills = {};

  bool _isFav = false;

  bool get isFav => _isFav;

  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkills(Skill skill) {
    skills.clear();
    skills.add(skill);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slogan': slogan,
      'vocation': vocation.toJson(),
      'skills': skills.map((skill) => skill.toJson()).toList(),
      'isFav': _isFav,
      'points': points,
      'health': health,
      'attack': attack,
      'defense': defense,
      'skill': skill,
    };
  }

  factory Character.fromJson(Map<String, dynamic> json) {
    final character = Character(
      id: json['id'],
      name: json['name'],
      slogan: json['slogan'],
      vocation: Vocation.fromJson(json['vocation']),
    );

    if (json['skills'] != null) {
      List<Skill> skillList = List<Skill>.from(
        json['skills'].map((skillJson) => Skill.fromJson(skillJson)),
      );

      for (var skill in skillList) {
        character.updateSkills(skill);
      }
    }

    if (json['isFav'] == true) {
      character.toggleIsFav();
    }

    character.setStats(points: json['points'], stats: json);

    return character;
  }
}
