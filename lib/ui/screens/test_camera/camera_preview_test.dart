import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import '../../../services/image_service.dart';

class CameraPreviewTest extends StatefulWidget {
  const CameraPreviewTest({super.key, required this.camera});

  final CameraDescription camera;

  @override
  State<CameraPreviewTest> createState() => _CameraPreviewTestState();
}

class _CameraPreviewTestState extends State<CameraPreviewTest> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  String? _imagePath;
  String? text;

  Future<void> _initializeCamera() async {
    await _cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        debugPrint(e.code);
      }
    });
  }

  Future<void> _captureImage() async {
    try {
      await _initializeControllerFuture;
      final XFile imageFile = await _cameraController.takePicture();
      final file = File(imageFile.path);
      final inputImage = InputImage.fromFile(file);
      text = await getIt<ImageService>().recognizeText(inputImage);

      setState(() {
        _imagePath = imageFile.path; // Save image path
      });
    } catch (e) {
      debugPrint('Error capturing image: $e');
    }
  }

  @override
  void initState() {
    _cameraController = CameraController(
      widget.camera,
      ResolutionPreset.high,
      enableAudio: false,
    );
    _initializeControllerFuture = _initializeCamera();
    super.initState();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Camera Preview')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: FutureBuilder(
                  future: _initializeControllerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return CameraPreview(_cameraController);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Column(
                  spacing: 10.0,
                  children: [
                    if (_imagePath != null) // Show image if captured
                      Image.file(
                        File(_imagePath!),
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    if (text != null) Text(text ?? ''),
                    ElevatedButton(
                      onPressed: _captureImage,
                      child: const Text('Capture Image'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
