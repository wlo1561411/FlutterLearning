import 'package:flutter/material.dart';
import 'package:sharing/shared/scaffold_builder.dart';

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
            elevatedButton(onPressed: () {}),
            elevatedButton(useTheme: false, onPressed: () {}),
            elevatedButtonIcon(iconAlignment: IconAlignment.start),
            elevatedButtonIcon(iconAlignment: IconAlignment.end),
            filledButton(isTonal: false, onPressed: null),
            filledButton(isTonal: false, onPressed: () {}),
            filledButton(onPressed: () {}),
            outlinedButton(),
            textButton(),
            shrinkTextButton(),
            iconButton(),
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
          ).wrapped()
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
          ).wrapped();
  }

  Widget elevatedButtonIcon({required IconAlignment iconAlignment}) {
    return ElevatedButton.icon(
      onPressed: () {},
      iconAlignment: iconAlignment,
      icon: const Icon(Icons.safety_check),
      label: const Text('This is ElevatedButton.icon.'),
    ).wrapped();
  }

  Widget filledButton(
      {bool isTonal = true, required void Function()? onPressed}) {
    return isTonal
        ? FilledButton.tonal(
            onPressed: onPressed,
            child: const Text('This is FilledButton.tonal.'),
          ).wrapped()
        : FilledButton(
            onPressed: onPressed,
            child: const Text('This is FilledButton.'),
          ).wrapped();
  }

  Widget outlinedButton() {
    return OutlinedButton(
      onPressed: () {},
      child: const Text('This is OutlinedButton.'),
    ).wrapped();
  }

  Widget textButton() {
    return TextButton(
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text('This is TextButton.'),
      ),
    ).wrapped();
  }

  Widget shrinkTextButton() {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: const Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text('This is TextButton.'),
      ),
    ).wrapped();
  }

  Widget iconButton() {
    return TextButton(
      onPressed: () {},
      child: SizedBox(
        width: 50,
        child: Image.asset('assets/about_logo_icon.png'),
      ),
    ).wrapped();
  }
}

extension _Wrap on Widget {
  Widget wrapped({Color color = Colors.black26}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: this,
    );
  }
}