import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ImageService {
  static final ImageService _instance = ImageService._internal();

  factory ImageService() {
    return _instance;
  }

  ImageService._internal();

  static Future<void> initialise() async {
    await _instance._initialiseCameras();
  }

  CameraDescription? camera;

  Future<void> _initialiseCameras() async {
    final cameras = await availableCameras();
    camera = cameras.first;
  }

  Future<File?> pickImage(ImageSource? source) async {
    if (source == null) return null;
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        return File(pickedFile.path);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  Future<String> recognizeText(File? image) async {
    if (image == null) return '';
    try {
      final inputImage = InputImage.fromFile(image);
      final textRecognizer = TextRecognizer();
      final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
      textRecognizer.close();
      return recognizedText.text;
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return '';
  }

  Future<XFile?> takePhoto(CameraController cameraController) async {
    final XFile? file;
    try {
      file = await cameraController.takePicture();
      return file;
    } catch (e) {
      if (kDebugMode) {
        print('Error capturing image: $e');
      }
    }
    return null;
  }
}

void setupImageServiceLocator() {
  getIt.registerSingletonAsync<ImageService>(() async {
    await ImageService.initialise();
    return ImageService();
  });
}
