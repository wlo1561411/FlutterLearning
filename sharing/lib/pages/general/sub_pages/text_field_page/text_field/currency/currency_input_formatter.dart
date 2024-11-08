import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  CurrencyInputFormatter({this.maxDecimalDigits = 8});

  final int maxDecimalDigits;

  /// 簡單 format
  final _generalFormat = NumberFormat.currency(
    /// 地區
    locale: 'en_US',

    /// 貨幣符號
    symbol: '',

    /// 保留小位數
    decimalDigits: 2,
  );

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    /// 刪除千分位
    String newText = newValue.text.replaceAll(',', '');

    /// 簡單的案例可以直接
    /// final formattedText = _generalFormat.format(newText);
    /// return newValue.copyWith(
    ///   text: formattedText,
    ///   selection: TextSelection.collapsed(offset: formattedText.length),
    /// );

    /// 分離出整數, 小數
    bool hasDecimal = newText.contains('.');
    List<String> parts = newText.split('.');

    /// 處理整數, 千分位
    String integerPart = parts[0];
    int? integerParsed = int.tryParse(integerPart.replaceAll(RegExp(r'[^0-9]'), ''));
    String formattedInteger = integerParsed != null
        ? NumberFormat("#,##0").format(integerParsed)
        : integerPart;

    /// 處理小數, 最多保留 maxDecimalDigits 位
    String decimalPart = '';
    if (hasDecimal && parts.length > 1) {
      decimalPart = parts[1].substring(0, parts[1].length.clamp(0, maxDecimalDigits));
      newText = '$formattedInteger.$decimalPart';
    } else {
      newText = formattedInteger;
    }
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  static void removeTrailingZeros(TextEditingController controller) {
    String text = controller.text;

    if (text.contains('.')) {
      /// 分離出整數, 小數
      List<String> parts = text.split('.');

      String integerPart = parts[0];
      String decimalPart = parts[1];

      /// 只處理小數部分
      /// 使用 double 轉換去除多餘的 0
      double decimalValue = double.tryParse('0.$decimalPart') ?? 0;
      decimalPart = decimalValue.toString().substring(2);

      text = decimalValue != 0 ? '$integerPart.$decimalPart' : integerPart;
    }

    controller.text = text;
    controller.selection = TextSelection.collapsed(offset: text.length);
  }

}
