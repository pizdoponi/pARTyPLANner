import 'package:app/src/config/app_icons.dart';
import 'package:flutter/cupertino.dart';

abstract class NavbarState {
  final List<Icon> icons;
  final int index;
  final PageController controller;

  NavbarState({
    required this.controller,
    required this.icons,
    required this.index,
  });
}

class HomeScreenActive extends NavbarState {
  HomeScreenActive({
    required int initialIndex,
    required PageController controller,
  }) : super(
          icons: [
            AppIcons.archive,
            AppIcons.search,
            AppIcons.add,
            AppIcons.friends,
            AppIcons.profile,
          ],
          index: initialIndex,
          controller: controller,
        );
}

class OtherScreenActive extends NavbarState {
  OtherScreenActive({
    required int initialIndex,
    required PageController controller,
  }) : super(
          icons: [
            AppIcons.archive,
            AppIcons.search,
            AppIcons.party,
            AppIcons.friends,
            AppIcons.profile,
          ],
          index: initialIndex,
          controller: controller,
        );
}
