mixin Regexps {
  /// Matches 13-19 digit numbers (Visa, MasterCard, etc.)
  static final RegExp cardNumberRegex = RegExp(
    r'\b(?:\d[ -]*?){13,19}\b',
  );

  /// Matches MM/YY or MM/YYYY
  static final RegExp expiryDateRegex = RegExp(
    r'\b(0[1-9]|1[0-2])\/([0-9]{2,4})\b',
  );

  /// Matches 3-4 digit CVV
  static final RegExp cvvRegex = RegExp(
    r'\b\d{3,4}\b',
  );

  static final RegExp spacesAndHyphens = RegExp(r'[^\d]');
}
