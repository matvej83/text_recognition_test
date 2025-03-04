import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class ImageService {
  const ImageService();

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
}
