import 'package:alice/alice.dart';
import 'package:flutter/widgets.dart';

class AliceProvider {
  factory AliceProvider() {
    return _singleton;
  }

  AliceProvider._internal();

  static final AliceProvider _singleton = AliceProvider._internal();

  Alice? _alice;

  void initializeAlice(
    GlobalKey<NavigatorState> navigatorKey,
    bool showNotification,
  ) {
    if (_alice != null) {
      return;
    }

    _alice =
        Alice(showNotification: showNotification, navigatorKey: navigatorKey);
  }

  Alice get getAlice => _alice!;
}
