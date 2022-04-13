import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../../config/app_icons.dart';

part 'navbar_states.freezed.dart';

@freezed
class NavbarState with _$NavbarState {
  @Assert("index == 2",
      "When the HomeScreen is active, the middle tab should be selected")
  const factory NavbarState.home({
    @Default([
      AppIcons.archive,
      AppIcons.search,
      AppIcons.add,
      AppIcons.friends,
      AppIcons.profile,
    ])
        List<Icon> icons,
    @Default(2)
        int index,
    required PageController pageController,
  }) = _Home;

  const factory NavbarState.other({
    @Default([
      AppIcons.archive,
      AppIcons.search,
      AppIcons.party,
      AppIcons.friends,
      AppIcons.profile,
    ])
        List<Icon> icons,
    required int index,
    required PageController pageController,
  }) = _Other;
}
