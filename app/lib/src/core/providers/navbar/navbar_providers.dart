import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'navbar_state_notifier.dart';
import 'navbar_states.dart';

final navbarStateProvider =
    StateNotifierProvider<NavbarStateNotifier, NavbarState>(
  (ref) => NavbarStateNotifier(
    HomeScreenActive(
      initialIndex: 2,
      controller: PageController(initialPage: 2),
    ),
  ),
);
