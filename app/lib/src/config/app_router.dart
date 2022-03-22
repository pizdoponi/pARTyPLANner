import 'package:app/src/config/app_routes.dart';
import 'package:app/src/core/screens/error_screen.dart';
import 'package:app/src/features/add_party/presentation/screens/add_party_screen.dart';
import 'package:app/src/features/archive/presentation/screens/archive_screen.dart';
import 'package:app/src/features/friends/presentation/screens/friends_screen.dart';
import 'package:app/src/features/home/presentation/screens/home_screen.dart';
import 'package:app/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:app/src/features/search/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => HomeScreen(),
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
        // for no transitions
        // pageBuilder: (context, state) => NoTransitionPage<void>(
        //   key: state.pageKey,
        //   child: HomeScreen(),
        // ),
      ),
      GoRoute(
        path: AppRoutes.search,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: SearchScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: AppRoutes.friends,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: FriendsScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: AppRoutes.profile,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: ProfileScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: AppRoutes.archive,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: ArchiveScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: AppRoutes.addParty,
        builder: (context, state) => const AddPartyScreen(),
      ),
    ],
    errorBuilder: (context, state) => const ErrorScreen(),
  );
}
