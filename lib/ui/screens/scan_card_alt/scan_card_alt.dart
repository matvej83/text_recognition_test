import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_recognition_test/ui/navigation/app_router.dart';

import '../../../bloc/card_scanner_bloc/card_scanner_bloc.dart';
import '../../../models/card_data.dart';
import '../../../services/image_service.dart';
import '../../navigation/screens.dart';

class ScanCardAlt extends StatelessWidget {
  const ScanCardAlt({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        spacing: 10.0,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              getIt<ImageService>().requestPermissions().then((granted) {
                if (granted) {
                  router.push(Screens.cardReaderPreview);
                } else {
                  debugPrint('Camera permission is not granted');
                }
              });
            },
            child: const Text('Scan Credit Card'),
          ),
          BlocBuilder<CardScannerBloc, CardScannerState>(
            buildWhen: (previous, current) {
              return current is ScanningAlt;
            },
            builder: (context, state) {
              CardData? cardDetails;
              if (state is ScanningAlt && state.cardData != null) {
                cardDetails = state.cardData;
                return Text(cardDetails.toString());
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
