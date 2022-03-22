import 'package:app/src/config/app_icons.dart';
import 'package:flutter/cupertino.dart';

abstract class NavbarState {
  final List<Icon> icons;
  final int index;

  NavbarState({required this.icons, required this.index});
}

class HomeScreenActive extends NavbarState {
  HomeScreenActive(int index)
      : super(
          icons: [
            AppIcons.archive,
            AppIcons.search,
            AppIcons.add,
            AppIcons.friends,
            AppIcons.profile,
          ],
          index: index,
        );
}

class OtherScreenActive extends NavbarState {
  OtherScreenActive(int index)
      : super(
          icons: [
            AppIcons.archive,
            AppIcons.search,
            AppIcons.party,
            AppIcons.friends,
            AppIcons.profile,
          ],
          index: index,
        );
}
