import 'package:go_router/go_router.dart';
import 'package:pokedex/logger.dart';
import 'package:pokedex/src/pages/home_page.dart';
import 'package:pokedex/src/pages/saved_page.dart';
import 'package:talker_flutter/talker_flutter.dart';

final router = GoRouter(
  observers: [TalkerRouteObserver(talker)],
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/',
      name: 'saved',
      builder: (context, state) => const SavedPage(),
    )
  ],
);

