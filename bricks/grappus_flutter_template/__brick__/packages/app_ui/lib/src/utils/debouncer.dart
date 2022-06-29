import 'dart:async';
import 'dart:ui';

class Debouncer {
  Debouncer({this.milliseconds = standardBouncerTimer});

  static const standardBouncerTimer = 2000;

  final int milliseconds;
  Timer? _timer;

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
