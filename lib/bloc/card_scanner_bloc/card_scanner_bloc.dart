import 'package:card_scanner/card_scanner.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'card_scanner_event.dart';

part 'card_scanner_state.dart';

part 'card_scanner_bloc.freezed.dart';

class CardScannerBloc extends Bloc<CardScannerEvent, CardScannerState> {
  CardScannerBloc() : super(Initial()) {
    on<CardScanned>((event, emit) async {
      emit(const Waiting());
      CardDetails? cardDetails = await CardScanner.scanCard(
        scanOptions: CardScanOptions(scanCardHolderName: true),
      );
      emit(Scanning(cardDetails));
    });

    on<CardScannedAlt>((event, emit) async {
      emit(ScanningAlt(event.text ?? ''));
    });
  }
}
