import 'package:go_router/go_router.dart';
import 'package:mapmobile/pages/Welcome/Welcome.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Welcome(),
    ),
  ],
);
