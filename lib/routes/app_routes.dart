import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackexpense/homepage.dart';
import 'package:trackexpense/view/screen/splash/view/splash_view.dart';

enum AppRoute {
  splashScreen,
}

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      name: AppRoute.splashScreen.name,
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
  ],
  errorBuilder: (context, state) {
    return const Scaffold(
      body: Center(
        child: Text('Error'),
      ),
    );
  },
);