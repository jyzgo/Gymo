library notification_center;

import 'dart:collection';

class NotificationCenter {
  static NotificationCenter _notificationCenter;
  factory NotificationCenter.instance() {
    if (_notificationCenter == null) {
      _notificationCenter = NotificationCenter._();
    }
    return _notificationCenter;
  }
  NotificationCenter._();
  HashMap<String, HashSet<NotificationListenerInterface>> _listeners =
      HashMap();

  addListener(String key, NotificationListenerInterface listener) {
    if (!_listeners.containsKey(key)) {
      HashSet<NotificationListenerInterface> _set = HashSet();
      _listeners[key] = _set;
    }

    _listeners[key].add(listener);
  }

  removeListener(String key, NotificationCenter listener) {
    if (_listeners.containsKey(key)) {
      var _set = _listeners[key];
      _set.remove(listener);
    }
  }

  post(String key, Object obj) {
    if (_listeners.containsKey(key)) {
      var _set = _listeners[key];
      for (var listener in _set) {
        listener.notified(obj);
      }
    }
  }
}

abstract class NotificationListenerInterface {
  notified(Object obj);
}
