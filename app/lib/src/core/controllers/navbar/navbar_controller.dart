import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../config/app_animations.dart';
import '../../../config/app_router.dart';
import '../../../config/app_routes.dart';
import '../../resources/controller.dart';
import 'navbar_event.dart';
import 'navbar_states.dart';

final navbarControllerProvider =
    StateNotifierProvider<NavbarController, NavbarState>(
  (ref) {
    return NavbarController(
      NavbarState.home(
        pageController: PageController(
          initialPage: 2,
        ),
      ),
    );
  },
);

class NavbarController extends Controller<NavbarEvent, NavbarState> {
  NavbarController(NavbarState state) : super(state);

  @override
  void emitEvent(NavbarEvent event) {
    event.when(
      onTap: (index) {
        _onTap(index);
      },
      onSwipe: (index) {
        _onSwipe(index);
      },
    );
  }

  /// Event triggered when user clicks on an icon in [Navbar].
  ///
  /// If current state is [NavbarState.home] and user clicks on middle icon,
  /// where [index] == 2, [AppRouter.router] pushes [AppRoutes.addParty] as active screen.
  ///
  /// Else change state to the specified [index]. Lastly, notify [state.pageController]
  /// to animate to specified page.
  void _onTap(int index) {
    state.when(
      home: (_icons, _index, pageController) {
        if (index == 2) {
          AppRouter.router.push(AppRoutes.addParty.path);
        } else {
          state =
              NavbarState.other(index: index, pageController: pageController);
        }
      },
      other: (_icons, _index, pageController) {
        if (index == 2) {
          state = NavbarState.home(pageController: pageController);
        } else {
          state =
              NavbarState.other(index: index, pageController: pageController);
        }
      },
    );

    state.pageController.animateToPage(
      index,
      duration: AppAnimations.navbarScreenChangeDuration,
      curve: AppAnimations.navbarScreenChangeCurve,
    );
  }

  /// Event when user swipes to another page.
  void _onSwipe(int index) {
    if (index == 2) {
      state = NavbarState.home(pageController: state.pageController);
    } else {
      state =
          NavbarState.other(index: index, pageController: state.pageController);
    }
  }
}
