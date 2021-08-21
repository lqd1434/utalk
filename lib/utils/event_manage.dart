import 'package:event_bus/event_bus.dart';

class EventManager {
  static EventManager? _eventManager;

  EventBus? eventBus;

  EventManager() {
    eventBus = EventBus();
  }

  static EventManager getInstance() {
    return _eventManager ??= EventManager();
  }
}
