import 'package:character_selector/models/skill.dart';
import 'package:character_selector/shared/styled_text.dart';
import 'package:character_selector/theme.dart';
import 'package:flutter/material.dart';
import '../models/character.dart';

class SkillList extends StatefulWidget {
  const SkillList(this.character, {super.key});

  final Character character;

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  late List<Skill> availableSkills;
  late Skill selectedSkill;

  @override
  void initState() {
    availableSkills = allSkills.where((skill) {
      return skill.vocation == widget.character.vocation;
    }).toList();

    if (widget.character.skills.isEmpty) {
      selectedSkill = availableSkills.first;
    }

    if (widget.character.skills.isNotEmpty) {
      selectedSkill = widget.character.skills.first;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: AppColors.secondaryColor.withOpacity(0.5),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const StyledHeading('Choose an active skill'),
            const StyledText('Skills are unique to your character.'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: availableSkills.map((skill) {
                return Expanded(
                  child:  Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: selectedSkill == skill ? Colors.yellow : Colors.transparent, width: 1),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSkill = skill;
                              widget.character.updateSkills(skill);
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              'assets/img/skills/${skill.image}',
                              fit: BoxFit.contain,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ),
                    ),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            StyledText(selectedSkill.name),
          ],
        ),
      ),
    );
  }
}
