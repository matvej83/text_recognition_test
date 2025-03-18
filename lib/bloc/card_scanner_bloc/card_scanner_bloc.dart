import 'package:card_scanner/card_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:text_recognition_test/services/credit_card_service.dart';

import '../../models/card_data.dart';

part 'card_scanner_bloc.freezed.dart';

part 'card_scanner_event.dart';

part 'card_scanner_state.dart';

class CardScannerBloc extends Bloc<CardScannerEvent, CardScannerState> {
  CardScannerBloc() : super(const Initial()) {
    on<CardScanned>((event, emit) async {
      emit(const Waiting());
      final CardDetails? cardDetails = await CardScanner.scanCard(
        scanOptions: const CardScanOptions(scanCardHolderName: true),
      );
      emit(Scanning(cardDetails));
    });

    on<CardScannedAlt>((event, emit) async {
      final cardData = CreditCardService().extractCardData(event.text ?? '');
      emit(ScanningAlt(cardData));
    });
  }
}
