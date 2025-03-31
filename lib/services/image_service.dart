import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:get_it/get_it.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

final getIt = GetIt.instance;

class ImageService {
  factory ImageService() {
    return _instance;
  }

  ImageService._internal();

  static final ImageService _instance = ImageService._internal();

  static Future<void> initialise() async {
    await _instance._initialiseCameras();
    if (Platform.isAndroid) {
      await _instance._getSdkVersion();
    }
  }

  CameraDescription? camera;
  CameraController? cameraController;
  int? sdkVersion;

  Future<void> _initialiseCameras() async {
    List<CameraDescription> cameras = [];
    try {
      cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        camera = cameras.first;
      } else {
        debugPrint('No cameras found');
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _getSdkVersion() async {
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    sdkVersion = androidInfo.version.sdkInt;
  }

  Future<void> initialiseCameraController() async {
    try {
      cameraController = CameraController(
        camera!,
        ResolutionPreset.high,
        enableAudio: false,
      );
      await cameraController?.initialize();
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  bool isCameraControllerInitialised() {
    return cameraController != null && cameraController!.value.isInitialized;
  }

  Future<void> disposeCameraController() async {
    await cameraController?.dispose();
    cameraController = null;
  }

  /// This method uses only for taking image from gallery. ImagePicker causes unexpected crash when camera is used.
  /// To get photo from camera we use camera library and takePhoto method
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

  Future<File?> takePhoto(CameraController cameraController) async {
    final XFile? initialFile;
    final File? file;
    try {
      if (cameraController.value.isInitialized) {
        initialFile = await cameraController.takePicture();
        file = File(initialFile.path);
        return file;
      }
    } catch (e) {
      debugPrint('Error capturing image: $e');
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

  /// Detects device camera orientation
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

  /// Conversion is needed for google_ml_kit
  Future<InputImage> convertCameraImageToInputImage(CameraImage image) async {
    late Uint8List jpegBytes;
    jpegBytes = convertCameraImageToUint8List(image)!;
    final inputImage = InputImage.fromBytes(
      bytes: jpegBytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: getInputImageRotation(camera!.sensorOrientation, camera!.lensDirection),
        format: Platform.isAndroid ? InputImageFormat.nv21 : InputImageFormat.bgra8888,
        // Converted to RGB
        bytesPerRow: image.planes[0].bytesPerRow,
      ),
    );

    return inputImage;
  }

  /// Converts Camera image to Uint8List to use with google_ml_kit
  ///
  /// Android (YUV420 format):
  /// Extracts Y, U, and V planes.
  /// Converts them to NV21 format, which is widely supported.
  ///
  /// iOS (BGRA8888 format):
  /// Directly returns the first plane, which contains the full image in BGRA format.
  ///
  /// Error Handling:
  /// Prints errors if an unsupported format is encountered.
  Uint8List? convertCameraImageToUint8List(CameraImage image) {
    try {
      if (image.format.group == ImageFormatGroup.yuv420) {
        /// YUV420 format (Android & some iOS devices)
        final int width = image.width;
        final int height = image.height;
        final int yRowStride = image.planes[0].bytesPerRow;
        final int uvRowStride = image.planes[1].bytesPerRow;
        final int uvPixelStride = image.planes[1].bytesPerPixel ?? 1;

        final Uint8List yBuffer = image.planes[0].bytes;
        final Uint8List uBuffer = image.planes[1].bytes;
        final Uint8List vBuffer = image.planes[2].bytes;

        final Uint8List nv21 = Uint8List(width * height + (width * height ~/ 2));

        /// Copy Y channel
        for (int i = 0; i < height; i++) {
          nv21.setRange(i * width, (i + 1) * width, yBuffer.sublist(i * yRowStride, i * yRowStride + width));
        }

        /// Copy UV channels
        int uvIndex = width * height;
        for (int i = 0; i < height ~/ 2; i++) {
          for (int j = 0; j < width ~/ 2; j++) {
            final int uIndex = i * uvRowStride + j * uvPixelStride;
            final int vIndex = i * uvRowStride + j * uvPixelStride;
            nv21[uvIndex++] = vBuffer[vIndex]; // V
            nv21[uvIndex++] = uBuffer[uIndex]; // U
          }
        }
        return nv21;
      } else if (image.format.group == ImageFormatGroup.bgra8888 || image.format.group == ImageFormatGroup.nv21) {
        /// BGRA8888 format (iOS), nv21 format (some Android devices)
        return image.planes[0].bytes;
      } else {
        debugPrint('Unsupported image format: ${image.format.group}');
        return null;
      }
    } catch (e) {
      debugPrint('Error converting CameraImage to Uint8List: $e');
      return null;
    }
  }

  Future<bool> requestPermissions() async {
    PermissionStatus? cameraStatus;
    PermissionStatus? photosStatus;
    if (Platform.isAndroid) {
      if (sdkVersion! < 33) {
        // permission storage is needed for android between 10 and 13
        if (sdkVersion! > 29) {
          final storageStatus = await Permission.storage.request();
          return storageStatus.isGranted;
        }
        // for android 10 and before no permissions needed
        return true;
      }
    }
    cameraStatus = await Permission.camera.request();
    photosStatus = await Permission.photos.request();
    if (cameraStatus.isGranted && photosStatus.isGranted) {
      return true;
    } else {
      debugPrint('Permissions denied: Camera: $cameraStatus, Photos: $photosStatus');
      return false;
    }
  }
}

void setupImageServiceLocator() {
  getIt.registerSingletonAsync<ImageService>(() async {
    await ImageService.initialise();
    return ImageService();
  });
}
