import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:text_recognition_test/services/credit_card_service.dart';
import 'package:text_recognition_test/services/image_service.dart';

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
    if (!mounted) {
      return;
    }
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
      final InputImage inputImage = getIt<ImageService>().convertCameraImageToInputImage(image);
      final RecognizedText recognizedText = await _textRecognizer.processImage(inputImage);
      final isCardNumberFound = CreditCardService().isValidCardNumber(recognizedText.text);

      if (recognizedText.text.isNotEmpty && isCardNumberFound) {
        setState(() => _cardDetected = true);
        await _cameraController.stopImageStream();
        if (mounted) {
          context.read<CardScannerBloc>().add(CardScannedAlt(recognizedText.text));
        }
        if (router.canPop()) {
          router.pop();
        }
      } else {
        setState(() => _cardDetected = false);
      }
    } catch (e) {
      debugPrint('Error detecting card: $e');
    } finally {
      _isProcessing = false;
    }
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
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
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
