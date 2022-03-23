import 'package:app/src/config/app_animations.dart';
import 'package:app/src/config/app_colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/navbar/navbar_providers.dart';

class Navbar extends ConsumerWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navbarState = ref.watch(navbarStateProvider);
    return CurvedNavigationBar(
      items: navbarState.icons,
      onTap: (int index) {
        print("tapped to page $index");
        ref.read(navbarStateProvider.notifier).onTap(
              index: index,
              context: context,
            );
        navbarState.controller.animateToPage(
          index,
          duration: AppAnimations.navbarScreenChangeDuration,
          curve: AppAnimations.navbarScreenChangeCurve,
        );
      },
      index: navbarState.index,
      color: AppColors.navbar,
      backgroundColor: Colors.transparent,
      animationDuration: AppAnimations.navbarScreenChangeDuration,
      animationCurve: AppAnimations.navbarScreenChangeCurve,
    );
  }
}
