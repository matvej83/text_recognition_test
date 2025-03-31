import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_recognition_test/ui/navigation/app_router.dart';

import '../../../bloc/image_processing_bloc/image_processing_bloc.dart';
import '../../../services/image_service.dart';

class CameraPreviewScreen extends StatefulWidget {
  const CameraPreviewScreen({super.key});

  @override
  State<CameraPreviewScreen> createState() => _CameraPreviewScreenState();
}

class _CameraPreviewScreenState extends State<CameraPreviewScreen> {
  late Future<void> _initializeControllerFuture;

  Future<void> _initializeCamera() async {
    if (getIt<ImageService>().isCameraControllerInitialised()) {
      return;
    }
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

  @override
  void initState() {
    _initializeControllerFuture = _initializeCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(getIt<ImageService>().cameraController!);
              } else {
                return const Center(child: CircularProgressIndicator.adaptive());
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.blue,
        onPressed: () {
          context.read<ImageProcessingBloc>().add(const ImageProcessed(ImageSource.camera));
          if (router.canPop()) {
            router.pop();
          }
        },
        child: const Icon(Icons.camera_alt_rounded, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
