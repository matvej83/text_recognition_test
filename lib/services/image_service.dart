import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

final getIt = GetIt.instance;

class ImageService {
  factory ImageService() {
    return _instance;
  }

  ImageService._internal();

  static final ImageService _instance = ImageService._internal();

  static Future<void> initialise() async {
    await _instance._initialiseCameras();
  }

  CameraDescription? camera;

  Future<void> _initialiseCameras() async {
    final cameras = await availableCameras();
    camera = cameras.first;
  }

  Future<File?> pickImage(ImageSource? source) async {
    if (source == null) {
      return null;
    }
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        return File(pickedFile.path);
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<String> recognizeText(File? image) async {
    if (image == null) {
      return '';
    }
    try {
      final inputImage = InputImage.fromFile(image);
      final textRecognizer = TextRecognizer();
      final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
      textRecognizer.close();
      return recognizedText.text;
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    return '';
  }

  Future<XFile?> takePhoto(CameraController cameraController) async {
    final XFile? file;
    try {
      file = await cameraController.takePicture();
      return file;
    } catch (e) {
      debugPrint('Error capturing image: $e');
    }
    return null;
  }

  InputImage convertCameraImageToInputImage(CameraImage image) {
    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final Uint8List bytes = allBytes.done().buffer.asUint8List();

    final InputImageMetadata metadata = InputImageMetadata(
      size: Size(image.width.toDouble(), image.height.toDouble()),
      rotation: InputImageRotation.rotation0deg,
      format: InputImageFormat.nv21,
      bytesPerRow: image.planes[0].bytesPerRow,
    );

    return InputImage.fromBytes(bytes: bytes, metadata: metadata);
  }
}

void setupImageServiceLocator() {
  getIt.registerSingletonAsync<ImageService>(() async {
    await ImageService.initialise();
    return ImageService();
  });
}
