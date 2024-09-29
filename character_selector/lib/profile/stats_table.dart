import 'package:character_selector/models/character.dart';
import 'package:character_selector/shared/styled_text.dart';
import 'package:character_selector/theme.dart';
import 'package:flutter/material.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5))
              ),
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Icon(Icons.star,
                      color: widget.character.points > 0
                          ? Colors.yellow
                          : Colors.grey),
                  const SizedBox(width: 20),
                  const StyledText('Star points available: '),
                  const Expanded(child: SizedBox(width: 20)),
                  StyledHeading(widget.character.points.toString()),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.secondaryColor.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))
              ),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: widget.character.cellModels.map((model) {
                  return TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: StyledHeading(model.title),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: StyledHeading(model.value),
                        ),
                      ),
                      TableCell(
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              model.increase();
                            });
                          },
                          icon: Icon(
                            Icons.arrow_upward,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                      TableCell(
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              model.decrease();
                            });
                          },
                          icon: Icon(
                            Icons.arrow_downward,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
