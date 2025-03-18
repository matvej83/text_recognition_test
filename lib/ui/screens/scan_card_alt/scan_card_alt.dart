import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_recognition_test/ui/navigation/app_router.dart';

import '../../../bloc/card_scanner_bloc/card_scanner_bloc.dart';
import '../../../services/image_service.dart';
import '../../navigation/screens.dart';

class ScanCardAlt extends StatelessWidget {
  const ScanCardAlt({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => router.push(Screens.cameraPreview, extra: getIt<ImageService>().camera),
            child: const Text('Scan Credit Card'),
          ),
          BlocBuilder<CardScannerBloc, CardScannerState>(builder: (context, state) {
            String? cardDetails;
            if (state is ScanningAlt && state.cardDetails != null) {
              cardDetails = state.cardDetails;
              return Text(cardDetails.toString());
            }
            return const SizedBox();
          }),
        ],
      ),
    );
  }
}
