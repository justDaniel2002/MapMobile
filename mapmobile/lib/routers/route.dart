import 'package:go_router/go_router.dart';
import 'package:mapmobile/pages/Book/Book.dart';
import 'package:mapmobile/pages/Event/Event.dart';
import 'package:mapmobile/pages/EventDetail/eventdetail.dart';
import 'package:mapmobile/pages/Map/map.dart';
import 'package:mapmobile/pages/ProductDetail/productdetail.dart';
import 'package:mapmobile/pages/Souvenir/Souvenir.dart';
import 'package:mapmobile/pages/Welcome/Welcome.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/product/:id',
      builder: (context, state) =>
          ProductDetail(pid: state.pathParameters['id']),
    ),
    GoRoute(
      path: '/event/:id',
      builder: (context, state) =>
          EventDetail(eventId: state.pathParameters['id']),
    ),
    GoRoute(
      path: '/map/:id',
      builder: (context, state) =>
          MapWidget(storeId: state.pathParameters['id']),
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
    GoRoute(
      path: '/',
      builder: (context, state) => const Welcome(),
    ),
  ],
);
