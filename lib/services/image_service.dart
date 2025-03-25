import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:get_it/get_it.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

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
    List<CameraDescription> cameras = [];
    try {
      cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        camera = cameras.first;
        print('camera direction ${camera?.sensorOrientation}');
      } else {
        debugPrint('No cameras found');
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<File?> pickImage(ImageSource? source) async {
    if (source == null) {
      return null;
    }
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        final initialFile = File(pickedFile.path);
        final rotatedImage = FlutterExifRotation.rotateAndSaveImage(path: initialFile.path);
        return rotatedImage;
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<String> recognizeText(InputImage? inputImage) async {
    if (inputImage == null) {
      return '';
    }
    try {
      final textRecognizer = TextRecognizer();
      final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
      textRecognizer.close();
      return recognizedText.text;
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    return '';
  }

  @Deprecated('not in use anymore')
  Future<XFile?> takePhoto(CameraController cameraController) async {
    final XFile? file;
    try {
      if (cameraController.value.isInitialized) {
        file = await cameraController.takePicture();
        return file;
      }
    } catch (e) {
      debugPrint('Error capturing image: $e');
    }
    return null;
  }

  @Deprecated('not in use anymore')
  Future<File> saveImageFromBytes(Uint8List bytes) async {
    final directory = await getTemporaryDirectory();
    final String filePath = '${directory.path}/captured_image.jpg';
    final File file = File(filePath);
    await file.writeAsBytes(bytes);
    return file;
  }

  InputImageRotation getInputImageRotation(int sensorOrientation, CameraLensDirection lensDirection) {
    switch (sensorOrientation) {
      case 90:
        return lensDirection == CameraLensDirection.front
            ? InputImageRotation.rotation270deg
            : InputImageRotation.rotation90deg;
      case 180:
        return InputImageRotation.rotation180deg;
      case 270:
        return lensDirection == CameraLensDirection.front
            ? InputImageRotation.rotation90deg
            : InputImageRotation.rotation270deg;
      default:
        return InputImageRotation.rotation0deg;
    }
  }

  InputImage convertCameraImageToInputImage(CameraImage image) {
    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final Uint8List bytes = allBytes.done().buffer.asUint8List();

    final InputImageMetadata metadata = InputImageMetadata(
      size: Size(image.width.toDouble(), image.height.toDouble()),
      rotation: getInputImageRotation(camera!.sensorOrientation, camera!.lensDirection),
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
