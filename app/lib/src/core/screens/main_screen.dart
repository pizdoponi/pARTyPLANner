import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/archive/presentation/screens/archive_screen.dart';
import '../../features/friends/presentation/screens/friends_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/search/presentation/screens/search_screen.dart';
import '../providers/navbar/navbar_providers.dart';
import '../widgets/navbar.dart';

/// The collection of main screens.
///
/// Main screens are:
/// 1. [ArchiveScreen]
/// 2. [SearchScreen]
/// 3. [HomeScreen]
/// 4. [FriendsScreen]
/// 5. [ProfileScreen]
///
/// They are collected in the [PageView] widget, making it possible to
/// swipe left and right to change the tabs.
/// [Navbar] is [Stack]ed on top of the main screens
class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(navbarStateProvider).controller;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            // when the page changes (user swiped)
            // notify the navbarStateProvider
            // so the navbar updates
            onPageChanged: (int index) {
              ref.read(navbarStateProvider.notifier).onSwipe(index);
            },
            // the children are the screens (tabs)
            children: [
              ArchiveScreen(),
              SearchScreen(),
              HomeScreen(),
              FriendsScreen(),
              ProfileScreen(),
            ],
          ),
          Container(
            child: const Navbar(),
            alignment: Alignment.bottomCenter,
          ),
        ],
      ),
    );
  }
}
