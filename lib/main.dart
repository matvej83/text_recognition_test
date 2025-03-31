import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_recognition_test/services/image_service.dart';
import 'package:text_recognition_test/ui/navigation/app_router.dart';
import 'package:text_recognition_test/ui/theme.dart';

import 'bloc/card_scanner_bloc/card_scanner_bloc.dart';
import 'bloc/image_processing_bloc/image_processing_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupImageServiceLocator();
  await getIt.isReady<ImageService>();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget with AppTheme {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CardScannerBloc(), lazy: true),
        BlocProvider(create: (context) => ImageProcessingBloc(), lazy: true)
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: AppTheme.mainTheme,
      ),
    );
  }
}
