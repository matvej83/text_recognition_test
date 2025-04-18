import 'package:camera/camera.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:text_recognition_test/services/credit_card_service.dart';
import 'package:text_recognition_test/services/image_service.dart';

import '../../../../bloc/card_scanner_bloc/card_scanner_bloc.dart';
import '../../../navigation/app_router.dart';
import 'card_overlay_painter.dart';

class CardReaderPreview extends StatefulWidget {
  const CardReaderPreview({super.key});

  @override
  State<CardReaderPreview> createState() => _CardReaderPreviewState();
}

class _CardReaderPreviewState extends State<CardReaderPreview> {
  bool _isProcessing = false;
  bool _cardDetected = false;

  Future<void> _initializeCamera() async {
    if (!getIt<ImageService>().isCameraControllerInitialised()) {
      await getIt<ImageService>().initialiseCameraController().then((_) {
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
    EasyDebounce.debounce('camera', const Duration(milliseconds: 500), () => _startCardDetection());
  }

  void _startCardDetection() {
    if (getIt<ImageService>().cameraController!.value.isStreamingImages) {
      debugPrint('Image stream already running.');
      return;
    }

    getIt<ImageService>().cameraController!.startImageStream((CameraImage image) {
      if (!_isProcessing) {
        _isProcessing = true;
        _detectCard(image).then((_) => _isProcessing = false);
      }
    });

    debugPrint('Image stream started.');
  }

  Future<void> _detectCard(CameraImage image) async {
    try {
      final InputImage inputImage = await getIt<ImageService>().convertCameraImageToInputImage(image);
      final recognizedText = await getIt<ImageService>().recognizeText(inputImage);
      final isCardNumberFound = CreditCardService().isValidCardNumber(recognizedText);

      if (recognizedText.isNotEmpty && isCardNumberFound) {
        setState(() => _cardDetected = true);
        await getIt<ImageService>().cameraController!.stopImageStream();
        if (mounted) {
          context.read<CardScannerBloc>().add(CardScannedAlt(recognizedText));
        }
        if (router.canPop()) {
          router.pop();
        }
      } else {
        if (mounted) {
          setState(() => _cardDetected = false);
        }
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
    getIt<ImageService>().disposeCameraController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!getIt<ImageService>().isCameraControllerInitialised()) {
      return const Scaffold(body: Center(child: CircularProgressIndicator.adaptive()));
    }
    return Scaffold(
      body: Stack(
        children: [
          CameraPreview(getIt<ImageService>().cameraController!),
          CustomPaint(
            painter: CardOverlayPainter(_cardDetected),
            child: Container(),
          ),
        ],
      ),
    );
  }
}
