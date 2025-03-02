import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  File? _image;
  String _recognizedText = '';
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      _recognizeText();
    }
  }

  Future<void> _recognizeText() async {
    if (_image == null) return;
    final inputImage = InputImage.fromFile(_image!);
    final textRecognizer = TextRecognizer();
    final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

    setState(() {
      _recognizedText = recognizedText.text;
    });
    textRecognizer.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text Recognition')),
      body: Column(
        spacing: 10.0,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_image != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(_image!, height: 200),
            ),
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.camera),
            child: const Text('Capture Image'),
          ),
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.gallery),
            child: const Text('Pick from Gallery'),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Text(_recognizedText, style: const TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
