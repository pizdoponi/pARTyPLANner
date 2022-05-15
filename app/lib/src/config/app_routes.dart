import 'package:go_router/go_router.dart';

import '../core/screens/main_screen.dart';
import '../features/create_party/presentation/screens/create_party_screen.dart';

class AppRoutes {
  static final GoRoute root = GoRoute(
    path: "/",
    name: "root",
    builder: (context, state) => const MainScreen(),
  );

  static final GoRoute createParty = GoRoute(
    path: "/createParty",
    name: "createParty",
    builder: (context, state) => CreatePartyScreen(
      pageIndex: 1,
    ),
  );

  // static const String home = "/home";
  // static const String friends = "/friends";
  // static const String profile = "/profile";
  // static const String search = "/search";
  // static const String archive = "/archive";
  // static const String party = "/party";
  // static const String error = "/error";
}
