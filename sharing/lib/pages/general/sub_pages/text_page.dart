import 'package:flutter/material.dart';
import 'package:sharing/shared/scaffold_builder.dart';
import 'package:flutter/gestures.dart';

/// source
/// https://docs.flutter.dev/ui/widgets/text
class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBuilder.title(
      appBarTitle: 'Text',
      context: context,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            normal(),
            withTheme(context),
            align(context, TextAlign.center),
            maxLine(context),
            maxLine(context, maxLines: 2),
            maxLine(context, maxLines: 2, overflow: TextOverflow.ellipsis),
            richText(),
            richTextWithClick(context),
            gradient(),
          ],
        ),
      ),
    );
  }

  Widget normal() {
    return const Text(
      'This is normal text.',
      style: TextStyle(color: Colors.yellow),
    ).wrapped();
  }

  Widget withTheme(BuildContext context) {
    return Text(
      'This is normal text.',
      style: Theme
          .of(context)
          .textTheme
          .titleMedium
          ?.copyWith(color: Colors.orange),
    ).wrapped();
  }

  Widget align(BuildContext context, TextAlign align) {
    return Text(
      'This is normal text.',
      textAlign: align,
      style: Theme
          .of(context)
          .textTheme
          .bodyMedium,
    ).wrapped();
  }

  Widget maxLine(BuildContext context,
      {int? maxLines, TextOverflow? overflow}) {
    return Text(
      'This is normal text.This is normal text.This is normal text.This is normal text.',
      maxLines: maxLines,
      overflow: overflow,
      style: Theme
          .of(context)
          .textTheme
          .bodyMedium,
    ).wrapped();
  }

  Widget richText() {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          color: Colors.grey,
          fontSize: 18,
        ),
        children: [
          TextSpan(text: 'This is '),
          TextSpan(
            text: 'bold ',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(text: 'and this is '),
          TextSpan(
            text: 'italic.',
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    ).wrapped();
  }

  Widget richTextWithClick(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 18,
        ),
        children: [
          const TextSpan(text: 'This is '),
          TextSpan(
            text: 'bold ',
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                showSnackBar(context, 'bold text');
              },
          ),
          const TextSpan(text: 'and this is '),
          TextSpan(
            text: 'italic.',
            style: const TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                showSnackBar(context, 'italic text');
              },
          ),
        ],
      ),
    ).wrapped();
  }

  Widget gradient() {
    return ShaderMask(
      shaderCallback: (bounds) =>
          const LinearGradient(
            colors: [Colors.blue, Colors.purple, Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
      child: const Text(
        'This is normal text.',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white, // mask
        ),
      ),
    ).wrapped();
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text),
      duration: const Duration(milliseconds: 500),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

extension _Wrap on Widget {
  Widget wrapped({Color color = Colors.black26}) {
    return Container(
      color: color,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      child: this,
    );
  }
}
