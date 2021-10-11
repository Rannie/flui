class FLDyLogger {
  static bool _enabled = true;
  static void disableLogger() => _enabled = false;

  static final List<int> _timeQueue = [];

  static void log(String msg) {
    assert(() {
      if (!_enabled) return true;
      print('[FLUI Dynamic] $msg');
      return true;
    }());
  }

  static void error(String msg) {
    assert(() {
      if (!_enabled) return true;
      print('[FLUI Dynamic] ERROR: $msg');
      return true;
    }());
  }

  static void logStartTime() {
    assert(() {
      if (!_enabled) return true;
      int time = DateTime.now().millisecondsSinceEpoch;
      _timeQueue.add(time);
      return true;
    }());
  }

  static void logEndTime(String event) {
    assert(() {
      if (!_enabled) return true;
      int time = DateTime.now().millisecondsSinceEpoch;
      int start = _timeQueue.removeLast();
      int spent = time - start;
      log('$event time: $spent ms');
      return true;
    }());
  }
}
