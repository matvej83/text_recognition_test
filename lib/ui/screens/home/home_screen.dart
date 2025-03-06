import 'dart:io';

import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_recognition_test/bloc/card_scanner_bloc/card_scanner_bloc.dart';
import 'package:text_recognition_test/bloc/image_processing_bloc/image_processing_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ImageProcessingBloc()),
        BlocProvider(create: (context) => CardScannerBloc()),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Text Recognition'),
          backgroundColor: Colors.white,
        ),
        body: BlocBuilder<ImageProcessingBloc, ImageProcessingState>(builder: (context, state) {
          File? image;
          String text = '';
          if (state is InProgress) {
            return Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          }
          if (state is Processing) {
            if (state.image != null) {
              image = state.image;
            }
            if (state.text != null) {
              text = state.text!;
            }
          }
          return Align(
            alignment: Alignment.center,
            child: Column(
              spacing: 10.0,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (image != null) Expanded(child: Image.file(image)),
                ElevatedButton(
                  onPressed: () => context.read<ImageProcessingBloc>()..add(ImageProcessed(ImageSource.camera)),
                  child: const Text('Capture Image'),
                ),
                ElevatedButton(
                  onPressed: () => context.read<ImageProcessingBloc>()..add(ImageProcessed(ImageSource.gallery)),
                  child: const Text('Pick from Gallery'),
                ),
                ElevatedButton(
                  onPressed: () => context.read<CardScannerBloc>()..add(CardScanned()),
                  child: const Text('Scan Credit Card'),
                ),
                BlocBuilder<CardScannerBloc, CardScannerState>(builder: (context, state) {
                  CardDetails? cardDetails;
                  if (state is Scanning && state.cardDetails != null) {
                    cardDetails = state.cardDetails;
                    return Text(cardDetails.toString());
                  }
                  return const SizedBox();
                }),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    physics: ClampingScrollPhysics(),
                    clipBehavior: Clip.hardEdge,
                    padding: const EdgeInsets.all(16.0),
                    child: Text(text, style: const TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
