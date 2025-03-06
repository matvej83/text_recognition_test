part of 'card_scanner_bloc.dart';

@freezed
class CardScannerEvent with _$CardScannerEvent {
  const factory CardScannerEvent.started() = Started;

  const factory CardScannerEvent.cardScanned() = CardScanned;
}
