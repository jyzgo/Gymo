library notification_center;

import 'dart:collection';

class ObserverCenter {
  static ObserverCenter _notificationCenter;
  factory ObserverCenter() {
    if (_notificationCenter == null) {
      _notificationCenter = ObserverCenter._();
    }
    return _notificationCenter;
  }
  ObserverCenter._();
  HashMap<int, HashSet<ObserverListenerInterface>> _listeners = HashMap();

  static addListener(int key, ObserverListenerInterface listener) {
    ObserverCenter()._addListener(key, listener);
  }

  _addListener(int key, ObserverListenerInterface listener) {
    if (!_listeners.containsKey(key)) {
      HashSet<ObserverListenerInterface> _set = HashSet();
      _listeners[key] = _set;
    }
    _listeners[key].add(listener);
  }

  static addMutipleListeners(
      List<int> keys, ObserverListenerInterface listener) {
    ObserverCenter()._addMutipleListeners(keys, listener);
  }

  _addMutipleListeners(List<int> keys, ObserverListenerInterface listener) {
    keys.forEach((key) {
      _addListener(key, listener);
    });
  }

  static removeListener(int key, ObserverListenerInterface listener) {
    ObserverCenter()._removeListener(key, listener);
  }

  _removeListener(int key, ObserverListenerInterface listener) {
    if (_listeners.containsKey(key)) {
      var _set = _listeners[key];
      _set.remove(listener);
    }
  }

  static removeMutipleListeners(
      List<int> keys, ObserverListenerInterface listener) {
    ObserverCenter()._removeMutipleListeners(keys, listener);
  }

  _removeMutipleListeners(List<int> keys, ObserverListenerInterface listener) {
    keys.forEach((key) {
      _removeListener(key, listener);
    });
  }

  static post(int key, [dynamic obj]) {
    ObserverCenter()._post(key, obj);
  }

  _post(int key, [dynamic obj]) {
    if (_listeners.containsKey(key)) {
      var _set = _listeners[key];
      for (var listener in _set) {
        listener.notified(obj, key);
      }
    }
  }
}

abstract class ObserverListenerInterface {
  void notified(dynamic obj, int key);
}
