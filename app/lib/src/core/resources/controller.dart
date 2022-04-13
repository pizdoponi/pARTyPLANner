import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class Controller<Event, State> extends StateNotifier<State> {
  Controller(State state) : super(state);
  void emitEvent(Event event);
}
