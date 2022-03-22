import 'package:app/src/config/app_animations.dart';
import 'package:app/src/config/app_colors.dart';
import 'package:app/src/core/providers/navbar/navbar_state_notifier.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Navbar extends ConsumerWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navbarState = ref.watch(navbarStateProvider);
    return CurvedNavigationBar(
      items: navbarState.icons,
      onTap: (int index) {
        ref.read(navbarStateProvider.notifier).onTap(
              index: index,
              context: context,
            );
      },
      index: navbarState.index,
      color: AppColors.navbar,
      backgroundColor: Colors.transparent,
      animationDuration: AppAnimations.navbarOnTapDuration,
    );
  }
}
