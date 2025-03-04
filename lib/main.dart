import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_recognition_test/ui/screens/home/home_screen.dart';
import 'package:text_recognition_test/ui/theme.dart';

import 'bloc/image_processing_bloc/image_processing_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget with AppTheme {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ImageProcessingBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        theme: AppTheme.mainTheme,
      ),
    );
  }
}
