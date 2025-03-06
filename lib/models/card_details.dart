import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_details.freezed.dart';

part 'card_details.g.dart';

@freezed
class CardDetails with _$CardDetails {
  const factory CardDetails({
    String? cardNumber,
    String? expiryDate,
    String? cardIssuer,
    String? cardHolderName,
  }) = _CardDetails;

  const CardDetails._();

  factory CardDetails.fromJson(Map<String, dynamic> json) => _$CardDetailsFromJson(json);
}
