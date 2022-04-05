import 'package:app/src/config/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'navbar_states.dart';

final navbarController = StateNotifierProvider<NavbarController, NavbarState>(
  (ref) => NavbarController(
    HomeScreenActive(
      index: 2,
      controller: PageController(initialPage: 2),
    ),
  ),
);

class NavbarController extends StateNotifier<NavbarState> {
  NavbarController(NavbarState state) : super(state);

  void onTap({required int index, required BuildContext context}) {
    // get the route the user wants to navigate to
    var route = _index2route(index);
    // if the user clicks on the middle [home] button
    if (route == AppRoutes.home) {
      // it depends if they were already on home screen
      // if they were already on home, they clicked on
      // the plus icon to add a party
      if (state is HomeScreenActive) {
        // navigate them to add party screen and exit
        context.push(AppRoutes.addParty);
        return;
      }
      // otherwise the user clicked on home button from some other tab
      else {
        state = HomeScreenActive(
          index: index,
          controller: state.pageController,
        );
      }
    }
    // the user clicked on one of the side tabs
    else {
      state = OtherScreenActive(
        index: index,
        controller: state.pageController,
      );
    }
  }

  void onSwipe(int index) {
    var route = _index2route(index);
    if (route == AppRoutes.home) {
      state = HomeScreenActive(
        index: index,
        controller: state.pageController,
      );
    } else {
      state = OtherScreenActive(
        index: index,
        controller: state.pageController,
      );
    }
  }

  String _index2route(int index) {
    switch (index) {
      case 0:
        return AppRoutes.archive;
      case 1:
        return AppRoutes.search;
      case 2:
        return AppRoutes.home;
      case 3:
        return AppRoutes.friends;
      case 4:
        return AppRoutes.profile;
      default:
        return AppRoutes.error;
    }
  }
}
