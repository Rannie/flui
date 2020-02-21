class FLDyLogger {
  static bool _enabled = true;
  static void disableLogger() => _enabled = false;

  static void log(String msg) {
    if (!_enabled) return;
    assert(() {
      print('[FLUI Dynamic] $msg');
      return true;
    }());
  }

  static void error(String msg) {
    if (!_enabled) return;
    assert(() {
      print('[FLUI Dynamic] ERROR: $msg');
      return true;
    }());
  }
}