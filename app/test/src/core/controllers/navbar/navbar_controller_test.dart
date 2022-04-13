import 'package:app/src/config/app_animations.dart';
import 'package:app/src/config/app_router.dart';
import 'package:app/src/config/app_routes.dart';
import 'package:app/src/core/controllers/navbar/navbar_controller.dart';
import 'package:app/src/core/controllers/navbar/navbar_event.dart';
import 'package:app/src/core/controllers/navbar/navbar_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// ignore_for_file: invalid_use_of_protected_member
// to access state in controllers

class MockPageController extends Mock implements PageController {}

void main() {
  late NavbarController sut;
  late MockPageController mockPageController;

  setUp(() {
    mockPageController = MockPageController();
    when(
      () => mockPageController.animateToPage(
        any(),
        duration: AppAnimations.navbarScreenChangeDuration,
        curve: AppAnimations.navbarScreenChangeCurve,
      ),
    ).thenAnswer((_) async => {});
  });
  group("onTap event", () {
    group("Initial NavbarState is home", () {
      setUp(() {
        var state = NavbarState.home(pageController: mockPageController);
        sut = NavbarController(state);
      });

      test(
          'addParty route should be pushed when + icon (the middle one) is pressed',
          () {
        // * Arrange
        var index = 2;
        var router = AppRouter.router;
        // * Act
        sut.emitEvent(NavbarEvent.onTap(index));
        // * Assert
        expect(router.location, AppRoutes.addParty.path);
      });

      test('Screen should change to index when a navbar button is pressed', () {
        // * Arrange
        var index = ([0, 1, 3, 4]..shuffle()).first;
        // * Act
        sut.emitEvent(NavbarEvent.onTap(index));
        // * Assert
        expect(sut.state.index, index);
        verify(
          () => mockPageController.animateToPage(
            index,
            duration: AppAnimations.navbarScreenChangeDuration,
            curve: AppAnimations.navbarScreenChangeCurve,
          ),
        ).called(1);
      });
    });
    group("Initial NavbarState is other", () {
      setUp(() {
        var state = NavbarState.other(
          pageController: mockPageController,
          index: 0,
        );
        sut = NavbarController(state);
      });

      test(
          'State should be updated to appropriate index, when the user clicks on a tab',
          () async {
        // * Arrange
        var tabIndex = ([1, 2, 3, 4]..shuffle()).first;
        // * Act
        sut.emitEvent(NavbarEvent.onTap(tabIndex));
        // * Assert
        expect(sut.state.index, tabIndex);
        verify(
          () => mockPageController.animateToPage(
            tabIndex,
            duration: AppAnimations.navbarScreenChangeDuration,
            curve: AppAnimations.navbarScreenChangeCurve,
          ),
        ).called(1);
      });
    });
  });
  group("onSwipe event", () {
    // TODO: test the onSwipe event
  });
}
