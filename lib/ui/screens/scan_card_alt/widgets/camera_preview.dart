import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import '../../../../bloc/card_scanner_bloc/card_scanner_bloc.dart';
import '../../../navigation/app_router.dart';
import 'card_overlay_painter.dart';

class CameraPreviewScreen extends StatefulWidget {
  const CameraPreviewScreen({super.key, required this.camera});

  final CameraDescription camera;

  @override
  State<CameraPreviewScreen> createState() => _CameraPreviewScreenState();
}

class _CameraPreviewScreenState extends State<CameraPreviewScreen> {
  late CameraController _cameraController;
  bool _isProcessing = false;
  final TextRecognizer _textRecognizer = TextRecognizer();
  bool _cardDetected = false;

  Future<void> _initializeCamera() async {
    _cameraController = CameraController(
      widget.camera,
      ResolutionPreset.high,
      enableAudio: false,
    );

    await _cameraController.initialize();
    if (!mounted) return;
    setState(() {});

    _startCardDetection();
  }

  void _startCardDetection() {
    if (_cameraController.value.isStreamingImages) {
      debugPrint('Image stream already running.');
      return;
    }

    _cameraController.startImageStream((CameraImage image) {
      if (!_isProcessing) {
        _isProcessing = true;
        _detectCard(image).then((_) => _isProcessing = false);
      }
    });

    debugPrint('Image stream started.');
  }

  Future<void> _detectCard(CameraImage image) async {
    try {
      final InputImage inputImage = _convertCameraImageToInputImage(image);
      final RecognizedText recognizedText = await _textRecognizer.processImage(inputImage);

      if (recognizedText.text.isNotEmpty) {
        setState(() => _cardDetected = true);
      } else {
        setState(() => _cardDetected = false);
      }
      await _cameraController.stopImageStream();
      context.read<CardScannerBloc>().add(CardScannedAlt(recognizedText.text));
      if (router.canPop()) {
        router.pop();
      }
    } catch (e) {
      debugPrint('Error detecting card: $e');
    } finally {
      _isProcessing = false;
    }
  }

  InputImage _convertCameraImageToInputImage(CameraImage image) {
    final WriteBuffer allBytes = WriteBuffer();
    for (Plane plane in image.planes) {
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

  @override
  void initState() {
    _initializeCamera();
    super.initState();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _textRecognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_cameraController.value.isInitialized) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      body: Stack(
        children: [
          CameraPreview(_cameraController),
          CustomPaint(
            painter: CardOverlayPainter(_cardDetected),
            child: Container(),
          ),
        ],
      ),
    );
  }
}
