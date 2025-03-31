import 'package:go_router/go_router.dart';
import 'package:text_recognition_test/ui/navigation/screens.dart';
import 'package:text_recognition_test/ui/screens/main_screen/main_screen.dart';
import 'package:text_recognition_test/ui/screens/scan_card/scan_card.dart';
import 'package:text_recognition_test/ui/screens/scan_card_alt/scan_card_alt.dart';
import 'package:text_recognition_test/ui/screens/scan_card_alt/widgets/card_reader_preview.dart';

import '../screens/camera_preview_screen/camera_preview_screen.dart';
import '../screens/recognize_text/recognise_text.dart';

final GoRouter router = GoRouter(
  initialLocation: Screens.recogniseText,
  routes: [
    /// routes with bottom nav bar
    ShellRoute(
      builder: (context, state, child) {
        return const MainScreen();
      },
      routes: [
        GoRoute(path: Screens.recogniseText, builder: (context, state) => const RecogniseText()),
        GoRoute(path: Screens.scanCard, builder: (context, state) => const ScanCard()),
        GoRoute(
          path: Screens.scanCardAlt,
          builder: (context, state) => const ScanCardAlt(),
        ),
      ],
    ),

    /// routes without bottom nav bar
    GoRoute(
      path: Screens.cardReaderPreview,
      builder: (context, state) => const CardReaderPreview(),
    ),
    GoRoute(
      path: Screens.cameraPreviewScreen,
      builder: (context, state) => const CameraPreviewScreen(),
    ),
  ],
);
