import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_recognition_test/bloc/image_processing_bloc/image_processing_bloc.dart';

class RecogniseText extends StatefulWidget {
  const RecogniseText({super.key});

  @override
  State<RecogniseText> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RecogniseText> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageProcessingBloc, ImageProcessingState>(builder: (context, state) {
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
          ],
        ),
      );
    });
  }
}
