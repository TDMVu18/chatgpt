class Global {
  static String _openaiKeys = '';

  static String get openaiKeys => _openaiKeys;

  static set openaiKeys(String keys) {
    _openaiKeys = keys;
  }
}
