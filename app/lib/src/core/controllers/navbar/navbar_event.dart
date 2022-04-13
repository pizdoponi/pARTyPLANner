import 'package:freezed_annotation/freezed_annotation.dart';

part 'navbar_event.freezed.dart';

@freezed
class NavbarEvent with _$NavbarEvent {
  const factory NavbarEvent.onTap(int index) = _OnTap;
  const factory NavbarEvent.onSwipe(int index) = _OnSwipe;
}
