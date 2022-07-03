import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../config/app_animations.dart';
import '../../config/app_colors.dart';
import '../controllers/navbar/navbar_controller.dart';
import '../controllers/navbar/navbar_event.dart';

class Navbar extends ConsumerWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navbarState = ref.watch(navbarControllerProvider);
    return CurvedNavigationBar(
      items: navbarState.icons,
      onTap: (int index) {
        ref.read(navbarControllerProvider.notifier).emitEvent(
              NavbarEvent.onTap(index),
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
