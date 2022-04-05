import 'package:app/src/config/app_icons.dart';
import 'package:flutter/cupertino.dart';

abstract class NavbarState {
  final List<Icon> icons;
  final int index;
  final PageController pageController;

  NavbarState({
    required this.pageController,
    required this.icons,
    required this.index,
  });
}

class HomeScreenActive extends NavbarState {
  HomeScreenActive({
    required int index,
    required PageController controller,
  }) : super(
          icons: [
            AppIcons.archive,
            AppIcons.search,
            AppIcons.add,
            AppIcons.friends,
            AppIcons.profile,
          ],
          index: index,
          pageController: controller,
        );
}

class OtherScreenActive extends NavbarState {
  OtherScreenActive({
    required int index,
    required PageController controller,
  }) : super(
          icons: [
            AppIcons.archive,
            AppIcons.search,
            AppIcons.party,
            AppIcons.friends,
            AppIcons.profile,
          ],
          index: index,
          pageController: controller,
        );
}
