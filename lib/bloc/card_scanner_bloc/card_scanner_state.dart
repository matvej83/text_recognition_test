part of 'card_scanner_bloc.dart';

@freezed
class CardScannerState with _$CardScannerState {
  const factory CardScannerState.initial() = Initial;

  const factory CardScannerState.waiting() = Waiting;

  const factory CardScannerState.scanning(CardDetails? cardDetails) = Scanning;

  const factory CardScannerState.scanningAlt(String? cardDetails) = ScanningAlt;
}
