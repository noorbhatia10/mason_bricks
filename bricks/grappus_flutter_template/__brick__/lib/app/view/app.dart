import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:{{project_name}}/navigator_key/nav_key.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.transparent,
        appBarTheme: const AppBarTheme(color: Colors.white),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Colors.white,
        ),
        fontFamily: fontInter,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      navigatorObservers: [
        NavKey().routeObserver,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      navigatorKey: NavKey().navKey,
      home: const Scaffold(),
    );
  }
}
