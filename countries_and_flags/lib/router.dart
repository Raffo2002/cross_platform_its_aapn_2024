import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:countries_and_flags/src/pages/filterpage.dart'; 
import 'package:countries_and_flags/src/pages/homepage.dart'; 

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Countries and Flags',
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: '/saved_flags',
            builder: (context, state) => const SavedFlagsPage(),
          ),
        ],
      ),
    );
  }
}
