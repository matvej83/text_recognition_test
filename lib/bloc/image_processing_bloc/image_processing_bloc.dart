import 'dart:io';

import 'package:camera/camera.dart';
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
      File? image;
      CameraController? cameraController;
      emit(const InProgress());
      if (event.source == ImageSource.gallery) {
        image = await getIt<ImageService>().pickImage(event.source);
      } else {
        if (!getIt<ImageService>().isCameraControllerInitialised()) {
          getIt<ImageService>().initialiseCameraController();
        }
        cameraController = getIt<ImageService>().cameraController;
        image = await getIt<ImageService>().takePhoto(cameraController!);
      }
      String? text;
      if (image != null) {
        final inputImage = InputImage.fromFile(image);
        text = await getIt<ImageService>().recognizeText(inputImage);
      }
      await getIt<ImageService>().disposeCameraController();
      emit(Processing(image: image, text: text));
    });
  }
}
