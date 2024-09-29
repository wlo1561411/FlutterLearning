import 'package:character_selector/shared/styled_text.dart';
import 'package:character_selector/theme.dart';
import 'package:flutter/material.dart';
import '../models/vocation.dart';

class VocationCard extends StatelessWidget {
  const VocationCard({
    super.key,
    required this.onTap,
    required this.vocation,
    required this.selected,
  });

  final void Function(Vocation) onTap;
  final Vocation vocation;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(vocation);
      },
      child: Card(
        color: selected ? AppColors.secondaryColor : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Image.asset(
                'assets/img/vocations/${vocation.image}',
                width: 80,
                colorBlendMode: BlendMode.color,
                color: selected ? Colors.transparent : Colors.black.withOpacity(0.8),
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    StyledHeading(vocation.title),
                    StyledText(vocation.description)
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
