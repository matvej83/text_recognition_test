import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_recognition_test/services/image_service.dart';

part 'image_processing_bloc.freezed.dart';

part 'image_processing_event.dart';

part 'image_processing_state.dart';

class ImageProcessingBloc extends Bloc<ImageProcessingEvent, ImageProcessingState> {
  ImageProcessingBloc() : super(const Initial()) {
    on<ImageProcessed>((event, emit) async {
      emit(const InProgress());
      final image = await getIt<ImageService>().pickImage(event.source);
      String? text;
      if (image != null) {
        final inputImage = InputImage.fromFile(image);
        text = await getIt<ImageService>().recognizeText(inputImage);
      }
      emit(Processing(image: image, text: text));
    });
  }
}
