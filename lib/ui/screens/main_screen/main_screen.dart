import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:text_recognition_test/ui/screens/recognize_text/recognise_text.dart';
import 'package:text_recognition_test/ui/screens/scan_card/scan_card.dart';
import 'package:text_recognition_test/ui/screens/scan_card_alt/scan_card_alt.dart';

import '../../../bloc/image_processing_bloc/image_processing_bloc.dart';
import '../../navigation/screens.dart';
import 'widgets/bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /// Using IndexedStack to prevent rebuilds
  final Map<int, Widget> _screens = {
    0: const RecogniseText(),
    1: const ScanCard(),
    2: const ScanCardAlt(),
  };

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    switch (location) {
      case Screens.recogniseText:
        return 0;
      case Screens.scanCard:
        return 1;
      case Screens.scanCardAlt:
        return 2;
    }
    return 0;
  }

  void _onItemTap(BuildContext context, {index}) {
    switch (index) {
      case 0:
        context.go(Screens.recogniseText);
        break;
      case 1:
        context.go(Screens.scanCard);
        break;
      case 2:
        context.go(Screens.scanCardAlt);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageProcessingBloc(),
      lazy: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: IndexedStack(
          index: _getCurrentIndex(context),
          children: _screens.values.toList(),
        ),
        bottomNavigationBar: BottomNavBar(
          currentPage: _getCurrentIndex(context),
          onItemTap: (index) {
            _onItemTap(context, index: index);
          },
        ),
      ),
    );
  }
}
