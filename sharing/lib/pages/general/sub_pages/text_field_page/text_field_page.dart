import 'package:flutter/material.dart';
import 'package:sharing/pages/general/sub_pages/text_field_page/text_field/currency/currency_text_field.dart';
import 'package:sharing/pages/general/sub_pages/text_field_page/text_field/date_pick/date_pick_text_field.dart';
import 'package:sharing/shared/scaffold_builder.dart';
import 'package:sharing/shared/title_builder.dart';

/// Source
/// https://api.flutter.dev/flutter/material/TextField-class.html
class TextFieldPage extends StatelessWidget with ScaffoldBuilder, TitleBuilder {
  const TextFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: scaffold(
        appBarTitle: 'TextField',
        context: context,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            title(context, 'TextField'),
            const CurrencyTextField(),
            const SizedBox(height: 32),
            const DatePickTextField(),
          ]),
        ),
      ),
    );
  }
}
