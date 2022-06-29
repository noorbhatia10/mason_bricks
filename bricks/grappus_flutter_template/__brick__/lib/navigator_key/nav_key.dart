import 'package:flutter/material.dart';

class NavKey {
  factory NavKey() {
    return _singleton;
  }

  NavKey._internal();

  static final NavKey _singleton = NavKey._internal();

  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  late bool showApiDebugger;

  void initializeAlice() {
    //AliceProvider().initializeAlice(navKey, showApiDebugger);
  }
}
