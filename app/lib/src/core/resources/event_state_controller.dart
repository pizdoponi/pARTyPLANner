import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class EventStateController<Event, State> extends StateNotifier<State> {
  EventStateController(State state) : super(state);
  void emitEvent(Event event);
}
