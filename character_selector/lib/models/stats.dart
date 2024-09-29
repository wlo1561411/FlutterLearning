mixin Stats {
  int _points = 10;
  int get points => _points;

  int _health = 10;
  int get health => _health;

  int _attack = 10;
  int get attack => _attack;

  int _defense = 10;
  int get defense => _defense;

  int _skill = 10;
  int get skill => _skill;

  List<CellModel> get cellModels => [
        CellModel(
            title: 'health',
            value: _health.toString(),
            increase: () {
              _updateStat(_health, _health + 1, (value) {
                _health = value;
              });
            },
            decrease: () {
              _updateStat(_health, _health - 1, (value) {
                _health = value;
              });
            }),
        CellModel(
            title: 'attack',
            value: _attack.toString(),
            increase: () {
              _updateStat(_attack, _attack + 1, (value) {
                _attack = value;
              });
            },
            decrease: () {
              _updateStat(_attack, _attack - 1, (value) {
                _attack = value;
              });
            }),
        CellModel(
            title: 'defense',
            value: _defense.toString(),
            increase: () {
              _updateStat(_defense, _defense + 1, (value) {
                _defense = value;
              });
            },
            decrease: () {
              _updateStat(_defense, _defense - 1, (value) {
                _defense = value;
              });
            }),
        CellModel(
            title: 'skill',
            value: _skill.toString(),
            increase: () {
              _updateStat(_skill, _skill + 1, (value) {
                _skill = value;
              });
            },
            decrease: () {
              _updateStat(_skill, _skill - 1, (value) {
                _skill = value;
              });
            }),
      ];

  void _updateStat(int currentValue, int newValue, void Function(int) update) {
    if (newValue > currentValue && _points > 0) {
      update(newValue);
      _points--;
    } else if (newValue < currentValue && currentValue > 5) {
      update(newValue);
      _points++;
    }
  }

  void setStats({ required int points, required Map<String, dynamic> stats}) {
    _points = points;
    _health = stats['health'];
    _attack = stats['attack'];
    _defense = stats['defense'];
    _skill = stats['skill'];
  }
}

class CellModel {
  const CellModel({
    required this.title,
    required this.value,
    required this.increase,
    required this.decrease,
  });

  final String title;
  final String value;
  final void Function() increase;
  final void Function() decrease;
}
