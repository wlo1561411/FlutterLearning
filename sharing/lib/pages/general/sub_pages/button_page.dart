import 'package:flutter/material.dart';
import 'package:sharing/shared/scaffold_builder.dart';
import 'package:sharing/theme.dart';

/// Source
/// https://api.flutter.dev/flutter/material/ButtonStyleButton-class.html
class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBuilder.title(
      appBarTitle: 'Button',
      context: context,
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            elevatedButton(onPressed: null),
            const SizedBox(height: 10),
            elevatedButton(onPressed: () {}),
            const SizedBox(height: 10),
            elevatedButton(useTheme: false, onPressed: () {}),
            const SizedBox(height: 10),
            elevatedButtonIcon(iconAlignment: IconAlignment.start),
            const SizedBox(height: 10),
            elevatedButtonIcon(iconAlignment: IconAlignment.end),
            const SizedBox(height: 10),
            filledButton(onPressed: null),
            const SizedBox(height: 10),
            filledButton(onPressed: () {}),
            const SizedBox(height: 10),
            filledButton(isTonal: false, onPressed: () {}),
            const SizedBox(height: 10),
            outlinedButton(),
          ],
        ),
      ),
    );
  }

  Widget elevatedButton(
      {bool useTheme = true, required void Function()? onPressed}) {
    return useTheme
        ? ElevatedButton(
            onPressed: onPressed,
            child: const Text('This is ElevatedButton.'),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
            ),
            onPressed: onPressed,
            child: const Text('This is ElevatedButton.'),
          );
  }

  Widget elevatedButtonIcon({required IconAlignment iconAlignment}) {
    return ElevatedButton.icon(
      onPressed: () {},
      iconAlignment: iconAlignment,
      icon: const Icon(Icons.safety_check),
      label: const Text('This is ElevatedButton.icon.'),
    );
  }

  Widget filledButton(
      {bool isTonal = true, required void Function()? onPressed}) {
    return isTonal
        ? FilledButton.tonal(
            onPressed: onPressed,
            child: const Text('This is FilledButton.'),
          )
        : FilledButton(
            onPressed: onPressed,
            child: const Text('This is FilledButton.'),
          );
  }

  Widget outlinedButton() {
    return OutlinedButton(
      onPressed: () {},
      child: const Text('This is OutlinedButton.'),
    );
  }
}
