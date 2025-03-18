import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_data.freezed.dart';

part 'card_data.g.dart';

@freezed
class CardData with _$CardData {
  const factory CardData({
    String? cardNumber,
    String? expiryDate,
    String? cvv,
  }) = _CardData;

  const CardData._();

  factory CardData.fromJson(Map<String, dynamic> json) => _$CardDataFromJson(json);
}
