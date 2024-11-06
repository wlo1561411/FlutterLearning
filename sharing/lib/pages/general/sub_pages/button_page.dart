import 'package:flutter/material.dart';
import 'package:sharing/shared/scaffold_builder.dart';
import 'package:sharing/shared/title_builder.dart';

/// Source
/// https://api.flutter.dev/flutter/material/ButtonStyleButton-class.html
class ButtonPage extends StatelessWidget with ScaffoldBuilder, TitleBuilder {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return scaffold(
      appBarTitle: 'Button',
      context: context,
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title(context, 'Material Buttons', color: Colors.black87),
            _elevatedButton(onPressed: null),
            _elevatedButton(onPressed: () {}),
            _elevatedButton(useTheme: false, onPressed: () {}),
            _elevatedButtonIcon(iconAlignment: IconAlignment.start),
            _elevatedButtonIcon(iconAlignment: IconAlignment.end),
            _filledButton(isTonal: false, onPressed: null),
            _filledButton(isTonal: false, onPressed: () {}),
            _filledButton(onPressed: () {}),
            _outlinedButton(),
            _textButton(),
            _shrinkTextButton(),
            _iconButton(),
            _inkWellCorrectIconButton(),
            _multipleStateIconButton(),
            title(context, 'InkWell', color: Colors.black87),
            _gradient(),
            title(context, 'Gesture Detector', color: Colors.black87),
            _gesture(),
          ],
        ),
      ),
    );
  }

  Widget _elevatedButton(
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

  Widget _elevatedButtonIcon({required IconAlignment iconAlignment}) {
    return ElevatedButton.icon(
      onPressed: () {},
      iconAlignment: iconAlignment,
      icon: const Icon(Icons.safety_check),
      label: const Text('This is ElevatedButton.icon.'),
    ).wrapped();
  }

  Widget _filledButton(
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

  Widget _outlinedButton() {
    return OutlinedButton(
      onPressed: () {},
      child: const Text('This is OutlinedButton.'),
    ).wrapped();
  }

  Widget _textButton() {
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

  Widget _shrinkTextButton() {
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

  Widget _iconButton() {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: const Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(4),
        ),
        child: _heytok(),
      ),
    ).wrapped();
  }

  Widget _inkWellCorrectIconButton() {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(10),
        minimumSize: const Size(0, 0),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: _heytok(),
    ).wrapped();
  }

  Widget _multipleStateIconButton() {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.white),
        padding: WidgetStateProperty.all(const EdgeInsets.all(10)),
        shape: WidgetStateProperty.resolveWith((states) {
          bool isPressed = states.contains(WidgetState.pressed);
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isPressed ? 20 : 4),
          );
        }),
        overlayColor:
            WidgetStateProperty.all(Colors.green.withOpacity(0.2) // ink color
                ),
      ),
      child: _heytok(),
    ).wrapped();
  }

  Widget _gradient() {
    return Ink(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.purple, Colors.red],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        splashColor: Colors.white.withOpacity(0.3),
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            'This is Gradient Button.',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ).wrapped();
  }

  Widget _gesture() {
    return GestureDetector(
      onTap: () {
        print('gesture on tapped');
      },
      child: _heytok(),
    ).wrapped();
  }

  Widget _heytok() {
    return Column(
      children: [
        SizedBox(
          width: 50,
          child: Image.asset('assets/about_logo_icon.png'),
        ),
        const SizedBox(width: 8),
        const Text(
          'Heytok',
          style: TextStyle(color: Colors.green),
        ),
      ],
    );
  }
}

extension _Wrap on Widget {
  Widget wrapped() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: this,
    );
  }
}
