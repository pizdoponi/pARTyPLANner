import '../core/screens/error_screen.dart';
import 'app_routes.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.root.path,
    routes: [
      AppRoutes.root,
      AppRoutes.addParty,
    ],
    errorBuilder: (context, state) => const ErrorScreen(),
  );
}
