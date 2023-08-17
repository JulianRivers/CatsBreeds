import 'package:cats_breeds/src/pages/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: LandingScreen.name,
    builder: (context, state) => const LandingScreen(),
  ),
]);
