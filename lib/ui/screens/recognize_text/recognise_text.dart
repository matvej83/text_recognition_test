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
      String? text;
      if (state is InProgress) {
        return const Center(
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
          text = state.text;
        }
      }
      return Center(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            spacing: 10.0,
            children: [
              if (image != null) Image.file(image),
              ElevatedButton(
                onPressed: () => context.read<ImageProcessingBloc>()..add(const ImageProcessed(ImageSource.camera)),
                child: const Text('Capture Image'),
              ),
              ElevatedButton(
                onPressed: () => context.read<ImageProcessingBloc>()..add(const ImageProcessed(ImageSource.gallery)),
                child: const Text('Pick from Gallery'),
              ),
              if (text != null) Text(text),
            ],
          ),
        ),
      );
    });
  }
}
