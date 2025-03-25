import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:get_it/get_it.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
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
  int? sdkVersion;

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

  Future<void> _getSdkVersion() async {
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    sdkVersion = androidInfo.version.sdkInt;
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

  Future<InputImage> convertCameraImageToInputImage(CameraImage image) async {
    late Uint8List jpegBytes;
    if (Platform.isAndroid && sdkVersion! < 33) {
      jpegBytes = convertCameraImageToBytes(image);
    } else {
      jpegBytes = await compute(convertCameraImageToJPEG, image);
    }
    final inputImage = InputImage.fromBytes(
      bytes: jpegBytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: getInputImageRotation(camera!.sensorOrientation, camera!.lensDirection),
        // Adjust if necessary
        format: sdkVersion != null && sdkVersion! < 33 ? InputImageFormat.nv21 : InputImageFormat.yuv420,
        // Converted to RGB
        bytesPerRow: image.planes[0].bytesPerRow,
      ),
    );

    return inputImage;
  }

  /// Common conversion
  Uint8List convertCameraImageToBytes(CameraImage image) {
    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    return allBytes.done().buffer.asUint8List();
  }

  /// Converts CameraImage (YUV420, BGRA8888, NV21) to JPEG
  Future<Uint8List> convertCameraImageToJPEG(CameraImage image) async {
    if (Platform.isAndroid) {
      if (image.format.group == ImageFormatGroup.yuv420) {
        return convertYUV420ToJPEG(image);
      } else if (image.format.group == ImageFormatGroup.nv21) {
        return convertNV21ToJPEG(image);
      }
    } else if (Platform.isIOS && image.format.group == ImageFormatGroup.bgra8888) {
      return convertBGRA8888ToJPEG(image);
    }

    throw UnsupportedError('Unsupported image format: ${image.format.group}');
  }

  /// Converts YUV420 (Android) to JPEG
  Uint8List convertYUV420ToJPEG(CameraImage image) {
    final int width = image.width;
    final int height = image.height;
    final img.Image convertedImage = img.Image(width: width, height: height);

    final yBuffer = image.planes[0].bytes;
    final uBuffer = image.planes[1].bytes;
    final vBuffer = image.planes[2].bytes;

    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        final int uvIndex = (y ~/ 2) * (width ~/ 2) + (x ~/ 2);
        final int yIndex = y * width + x;

        final int Y = yBuffer[yIndex];
        final int U = uBuffer[uvIndex] - 128;
        final int V = vBuffer[uvIndex] - 128;

        final int R = (Y + 1.402 * V).clamp(0, 255).toInt();
        final int G = (Y - 0.344136 * U - 0.714136 * V).clamp(0, 255).toInt();
        final int B = (Y + 1.772 * U).clamp(0, 255).toInt();

        convertedImage.setPixel(x, y, img.ColorInt8.rgb(R, G, B));
      }
    }

    return Uint8List.fromList(img.encodeJpg(convertedImage));
  }

  /// Converts NV21 (Some Android Devices) to JPEG
  Uint8List convertNV21ToJPEG(CameraImage image) {
    final int width = image.width;
    final int height = image.height;
    final img.Image convertedImage = img.Image(width: width, height: height);

    final yBuffer = image.planes[0].bytes;

    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        final int Y = yBuffer[y * width + x];
        convertedImage.setPixel(x, y, img.ColorInt8.rgb(Y, Y, Y));
      }
    }

    return Uint8List.fromList(img.encodeJpg(convertedImage));
  }

  /// Converts BGRA8888 (iOS) to JPEG
  Uint8List convertBGRA8888ToJPEG(CameraImage image) {
    final int width = image.width;
    final int height = image.height;
    final img.Image convertedImage = img.Image(width: width, height: height);

    final Uint8List rgba = image.planes[0].bytes;

    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        final int index = (y * width + x) * 4;
        final int R = rgba[index];
        final int G = rgba[index + 1];
        final int B = rgba[index + 2];
        convertedImage.setPixel(x, y, img.ColorInt8.rgb(R, G, B));
      }
    }

    return Uint8List.fromList(img.encodeJpg(convertedImage));
  }

  Future<bool> requestPermissions() async {
    // ignore for android before 13
    if (Platform.isAndroid && sdkVersion! < 33) {
      return true;
    }
    // request permissions for Camera and Photos (for Android 13+)
    final PermissionStatus cameraStatus = await Permission.camera.request();
    final PermissionStatus photosStatus = await Permission.photos.request(); // Android 13+ and iOS

    if (cameraStatus.isGranted && photosStatus.isGranted) {
      return true; // All permissions granted
    } else {
      debugPrint('Permissions denied: Camera: $cameraStatus, Photos: $photosStatus');
      return false; // Permissions not granted
    }
  }
}

void setupImageServiceLocator() {
  getIt.registerSingletonAsync<ImageService>(() async {
    await ImageService.initialise();
    return ImageService();
  });
}
