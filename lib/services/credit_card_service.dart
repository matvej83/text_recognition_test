import '../constants/regexps.dart';
import '../models/card_data.dart';

class CreditCardService with Regexps {
  CardData extractCardData(String text) {
    final cardNumber = detectData(text: text, regexp: Regexps.cardNumberRegex);
    final expiryDate = detectData(text: text, regexp: Regexps.expiryDateRegex);
    final cvv = detectData(text: text, regexp: Regexps.cvvRegex);

    return CardData(cardNumber: cardNumber?.replaceAll(Regexps.spacesAndHyphens, ''), expiryDate: expiryDate, cvv: cvv);
  }

  String? detectData({required String text, required RegExp regexp}) {
    return regexp.firstMatch(text)?.group(0);
  }

  bool isValidCardNumber(String text) {
    return detectData(text: text, regexp: Regexps.cardNumberRegex)?.isNotEmpty ?? false;
  }
}
