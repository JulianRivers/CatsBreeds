import 'package:cats_breeds/src/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: LandingPageScreen.name,
    builder: (context, state) => const LandingPageScreen(),
  )
]);
