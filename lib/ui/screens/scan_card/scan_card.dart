import 'package:card_scanner/models/card_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_recognition_test/bloc/card_scanner_bloc/card_scanner_bloc.dart';

class ScanCard extends StatelessWidget {
  const ScanCard({super.key});

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
            onPressed: () => context.read<CardScannerBloc>()..add(const CardScanned()),
            child: const Text('Scan Credit Card'),
          ),
          BlocBuilder<CardScannerBloc, CardScannerState>(
            buildWhen: (previous, current) {
              return current is Scanning;
            },
            builder: (context, state) {
              CardDetails? cardDetails;
              if (state is Scanning && state.cardDetails != null) {
                cardDetails = state.cardDetails;
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
