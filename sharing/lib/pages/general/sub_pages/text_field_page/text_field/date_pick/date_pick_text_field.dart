import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickTextField extends StatefulWidget {
  const DatePickTextField({super.key});

  @override
  State<DatePickTextField> createState() => _DatePickTextFieldState();
}

class _DatePickTextFieldState extends State<DatePickTextField> {
  final _textEditingController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      readOnly: true,
      style: const TextStyle(color: Colors.redAccent),
      decoration: const InputDecoration(
        hintText: 'Select Date',
        hintStyle: TextStyle(
          color: Colors.white24,
          fontWeight: FontWeight.normal,
          fontSize: 16,
          letterSpacing: 0,
        ),
        suffixIcon: Icon(Icons.calendar_today),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      onTap: () async {
        // _showFlutterDatePicker();
        _showCupertinoDatePicker(context);
      },
    );
  }

  void _updateSelectedDate(DateTime? date) {
    _selectedDate = date ?? DateTime.now();

    setState(() {
      if (date != null) {
        _textEditingController.text = DateFormat('yyyy-MM-dd').format(date);
      } else {
        _textEditingController.clear();
        FocusScope.of(context).unfocus();
      }
    });
  }

  void _showFlutterDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    _updateSelectedDate(pickedDate);
  }

  void _showCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (ctx) => Container(
        height: 300,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 10),
              alignment: Alignment.centerRight,
              child: CupertinoButton(
                child: const Text("Done"),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              ),
            ),
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: _selectedDate,
                minimumDate: DateTime(2000, 1, 1),
                maximumDate: DateTime(2100, 12, 31),
                onDateTimeChanged: (date) => _updateSelectedDate(date),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
