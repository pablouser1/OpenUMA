import 'dart:math';

class Randomize {
  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  static final Random _rnd = Random();

  static String string([int length = 32]) {
    return String.fromCharCodes(
      Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))
      )
    );
  }
}