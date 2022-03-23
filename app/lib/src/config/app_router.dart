import 'package:app/src/config/app_routes.dart';
import 'package:app/src/core/screens/error_screen.dart';
import 'package:app/src/core/screens/main_screen.dart';
import 'package:go_router/go_router.dart';

import '../features/add_party/presentation/screens/add_party_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const MainScreen(),
      ),
      //! with the introduction of [MainScreen] as the root
      //! the individual routes are no longer necesary
      // GoRoute(
      //   path: AppRoutes.home,
      //   builder: (context, state) => const HomeScreen(),
      //   pageBuilder: (context, state) => CustomTransitionPage<void>(
      //     key: state.pageKey,
      //     child: const HomeScreen(),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) =>
      //         FadeTransition(opacity: animation, child: child),
      //   ),
      //   // for no transitions
      //   // pageBuilder: (context, state) => NoTransitionPage<void>(
      //   //   key: state.pageKey,
      //   //   child: HomeScreen(),
      //   // ),
      // ),
      // GoRoute(
      //   path: AppRoutes.search,
      //   pageBuilder: (context, state) => CustomTransitionPage<void>(
      //     key: state.pageKey,
      //     child: const SearchScreen(),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) =>
      //         FadeTransition(opacity: animation, child: child),
      //   ),
      // ),
      // GoRoute(
      //   path: AppRoutes.friends,
      //   pageBuilder: (context, state) => CustomTransitionPage<void>(
      //     key: state.pageKey,
      //     child: const FriendsScreen(),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) =>
      //         FadeTransition(opacity: animation, child: child),
      //   ),
      // ),
      // GoRoute(
      //   path: AppRoutes.profile,
      //   pageBuilder: (context, state) => CustomTransitionPage<void>(
      //     key: state.pageKey,
      //     child: const ProfileScreen(),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) =>
      //         FadeTransition(opacity: animation, child: child),
      //   ),
      // ),
      // GoRoute(
      //   path: AppRoutes.archive,
      //   pageBuilder: (context, state) => CustomTransitionPage<void>(
      //     key: state.pageKey,
      //     child: const ArchiveScreen(),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) =>
      //         FadeTransition(opacity: animation, child: child),
      //   ),
      // ),
      GoRoute(
        path: AppRoutes.addParty,
        builder: (context, state) => const AddPartyScreen(),
      ),
    ],
    errorBuilder: (context, state) => const ErrorScreen(),
  );
}
