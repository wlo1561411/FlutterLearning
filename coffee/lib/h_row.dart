import 'package:flutter/material.dart';
import 'package:coffee/styled_body_text.dart';
import 'package:coffee/styled_button.dart';

class HRow extends StatefulWidget {
  const HRow({super.key});

  @override
  State<HRow> createState() => _HRowState();
}

class _HRowState extends State<HRow> {
  int strength = 1;
  int sugar = 0;

  void increaseStrength() {
    setState(() {
      strength = strength >= 5 ? 1 : strength + 1;
    });
  }

  void increaseSugar() {
    setState(() {
      sugar = sugar >= 5 ? 0 : sugar + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const StyledBodyText('Strength: '),

            for (int i = 0; i < strength; i++)
              Image.asset(
                'assets/img/coffee_bean.png',
                width: 25,
                color: Colors.brown[200],
                colorBlendMode: BlendMode.multiply,
              ),

            const Expanded(child: SizedBox()),
            StyledButton(
                onPressed: increaseStrength,
                child: const Text('+')),
          ],
        ),
        Row(
          children: [
            const StyledBodyText('Sugar: '),

            if (sugar == 0)
              const StyledBodyText('No Sugar...'),

            for (int i = 0; i < sugar; i++)
              Image.asset(
                'assets/img/sugar_cube.png',
                width: 25,
                color: Colors.brown[200],
                colorBlendMode: BlendMode.multiply,
              ),

            const Expanded(child: SizedBox()),
            StyledButton(
                onPressed: increaseSugar,
                child: const Text('+')),
          ],
        )
      ],
    );
  }
}
