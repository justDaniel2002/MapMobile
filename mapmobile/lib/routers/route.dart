import 'package:go_router/go_router.dart';
import 'package:mapmobile/pages/Book/Book.dart';
import 'package:mapmobile/pages/Event/Event.dart';
import 'package:mapmobile/pages/Souvenir/Souvenir.dart';
import 'package:mapmobile/pages/Welcome/Welcome.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Welcome(),
    ),
    GoRoute(
      path: '/books',
      builder: (context, state) => const Book(),
    ),
    GoRoute(
      path: '/souvenir',
      builder: (context, state) => const Souvenir(),
    ),
    GoRoute(
      path: '/event',
      builder: (context, state) => const Event(),
    ),
  ],
);
