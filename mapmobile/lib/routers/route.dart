import 'package:go_router/go_router.dart';
import 'package:mapmobile/pages/Book/Book.dart';
import 'package:mapmobile/pages/Event/Event.dart';
import 'package:mapmobile/pages/EventDetail/eventdetail.dart';
import 'package:mapmobile/pages/Map/fullmap.dart';
import 'package:mapmobile/pages/MapOf/map.dart';
import 'package:mapmobile/pages/MapPicking/mapPicking.dart';
import 'package:mapmobile/pages/Point/InputPhone.dart';
import 'package:mapmobile/pages/Point/Overall.dart';
import 'package:mapmobile/pages/Point/PointHistory.dart';
import 'package:mapmobile/pages/ProductDetail/productdetail.dart';
import 'package:mapmobile/pages/Souvenir/Souvenir.dart';
import 'package:mapmobile/pages/Welcome/Welcome.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/pointHistory/:customerId/:storeId',
      builder: (context, state) => PointHistory(
        customerId: state.pathParameters['customerId'],
        storeId: state.pathParameters['storeId'],
      ),
    ),
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
      path: '/pointOverall/:phone',
      builder: (context, state) =>
          Overall(phone: state.pathParameters['phone']),
    ),
    GoRoute(
      path: '/books',
      builder: (context, state) => const Book(),
    ),
    GoRoute(
      path: '/points',
      builder: (context, state) => const Inputphone(),
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
      path: '/map',
      builder: (context, state) => const FullMap(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const Welcome(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const MapPicking(),
    ),
  ],
);
