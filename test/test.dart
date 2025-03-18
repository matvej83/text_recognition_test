import 'package:flutter_test/flutter_test.dart';
import 'package:text_recognition_test/services/credit_card_service.dart';

void main() {
  group('isValidCardNumber test', () {
    test('#1', () {
      const text = '1234 5678 1234 5678';
      const expected = true;
      final found = CreditCardService().isValidCardNumber(text);
      expect(found, expected);
    });
    test('#2', () {
      const text = '5678 1234 5678';
      const expected = false;
      final found = CreditCardService().isValidCardNumber(text);
      expect(found, expected);
    });
    test('#3', () {
      const text = '5678 1234 5678 wter';
      const expected = false;
      final found = CreditCardService().isValidCardNumber(text);
      expect(found, expected);
    });
  });
}
