import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_recognition_test/services/image_service.dart';

part 'image_processing_event.dart';

part 'image_processing_state.dart';

part 'image_processing_bloc.freezed.dart';

class ImageProcessingBloc extends Bloc<ImageProcessingEvent, ImageProcessingState> {
  ImageProcessingBloc() : super(Initial()) {
    on<ImageProcessed>((event, emit) async {
      emit(const InProgress());
      final image = await getIt<ImageService>().pickImage(event.source);
      String? text;
      if (image != null) {
        text = await getIt<ImageService>().recognizeText(image);
      }
      emit(Processing(image: image, text: text));
    });
  }
}
