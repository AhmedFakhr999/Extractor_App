import 'package:go_router/go_router.dart';
import 'package:ocr/features/home/view/home.dart';

import '../splash_screen/splash.dart';

class Routes {
  static const String splashScreen = '/';
  static const String home = '/home';
  
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: splashScreen, 
        builder: (context, state) {
          return const Splash();
        }
      ),
      GoRoute(
        path: home,
        builder: (context, state) {
          return const HomePage();
        }
      ),
    ],
  );
}