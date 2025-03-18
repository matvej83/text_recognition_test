bool isValidCardNumber(String text) {
  return RegExp(r'^[0-9\s]{13,19}$').hasMatch(text.replaceAll(' ', ''));
}
