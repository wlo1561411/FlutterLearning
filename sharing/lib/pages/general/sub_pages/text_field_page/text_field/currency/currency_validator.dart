class CurrencyValidator {
  bool validate(String text) {
    if (text.isEmpty) return true;
    final amount = double.tryParse(text.replaceAll(',', '')) ?? 0;
    return amount > 0;
  }
}
