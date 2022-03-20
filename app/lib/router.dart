import 'package:app/src/config/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.home,
      // TODO: make the builder return the HomeScreen: to be defined in ./home/presentation/screens
      builder: (context, state) => const Scaffold(),
    ),
  ],
);
