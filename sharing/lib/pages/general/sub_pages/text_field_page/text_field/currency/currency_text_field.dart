import 'package:flutter/material.dart';
import 'package:sharing/pages/general/sub_pages/text_field_page/text_field/currency/currency_input_formatter.dart';
import 'package:sharing/pages/general/sub_pages/text_field_page/text_field/currency/currency_validator.dart';

class CurrencyTextField extends StatefulWidget {
  const CurrencyTextField({super.key});

  @override
  State<CurrencyTextField> createState() => _CurrencyTextFieldState();
}

class _CurrencyTextFieldState extends State<CurrencyTextField> {
  final _textEditingController = TextEditingController();
  final _focusNode = FocusNode();
  final _validator = CurrencyValidator();

  String? errorText;
  Color? labelColor;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(observeOnFocus);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      focusNode: _focusNode,
      onChanged: (text) => _validInput(),

      /// 鍵盤樣式
      keyboardType: const TextInputType.numberWithOptions(decimal: true),

      /// 輸入文字是否為明文
      obscureText: false,

      /// 文字處理
      /// textShouldReplacement
      inputFormatters: [
        CurrencyInputFormatter(),
      ],

      /// Input text style
      style: const TextStyle(
        color: Colors.white,
        letterSpacing: 0,
      ),
      decoration: InputDecoration(
        /// padding
        /// 包含內部的 text
        contentPadding: const EdgeInsetsDirectional.all(10),

        /// 去除一些系統額外的垂直空間
        isDense: true,

        /// onFocus 後上方的標籤
        /// unFocus 時是 placeholder
        /// 也可以自訂 Widget
        /// label: ...
        labelText: 'Enter amount',
        labelStyle: TextStyle(
          color: labelColor,
        ),

        /// 浮在上方時的 style, 額外可以設定
        // floatingLabelStyle: const TextStyle(color: Colors.green),

        /// 可以控制 label 顯示的時機
        // floatingLabelBehavior: FloatingLabelBehavior.always,

        /// onFocus placeholder
        hintText: '100 ',
        hintStyle: const TextStyle(
          color: Colors.white24,
          letterSpacing: 0,
        ),

        /// 下方的標籤, 與 errorText 擇一顯示
        /// 也可以自訂 Widget
        /// helper: ...
        helperText: 'Please enter amount',
        helperStyle: const TextStyle(color: Colors.white70),

        /// 不為空時代表狀態是 error, 相對應的 border 會出現
        /// 也可以自訂 Widget
        /// error: ...
        errorText: errorText,
        errorStyle: const TextStyle(color: Colors.red),

        /// 為輸入文本的前綴
        /// 不與整個 Field 為一體
        prefix: const Text(
          'USDT ',
          style: TextStyle(
            color: Colors.white24,
            letterSpacing: 0,
          ),
        ),

        /// 與整個 Field 為一體
        /// 類似 leftView, 但寬度有限制最小為 48 px
        prefixIcon: const Icon(Icons.currency_exchange),
        prefixIconColor: Colors.white,

        /// 適用於所有狀態
        border: const OutlineInputBorder(),

        /// normal
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),

        /// onFocus
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2.0),
        ),

        /// onError
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),

        /// onFocus, onError
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
      ),
    );
  }

  void observeOnFocus() {
    if (!_focusNode.hasFocus) {
      CurrencyInputFormatter.removeTrailingZeros(_textEditingController);
    }
    _validInput();
  }

  void _validInput() {
    final text = _textEditingController.text;
    setState(() {
      if (!_validator.validate(text)) {
        errorText = 'Input amount is not correct';
        labelColor = Colors.red;
      } else {
        errorText = null;

        final isFocus = _focusNode.hasFocus;

        if (!isFocus && text.isEmpty) {
          labelColor = Colors.white24;
        } else {
          labelColor = !isFocus ? Colors.white70 : Colors.green;
        }
      }
    });
  }
}
