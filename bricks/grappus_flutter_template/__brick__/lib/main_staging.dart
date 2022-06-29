import 'package:api_controller/api_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:{{project_name}}/app/app.dart';
import 'package:{{project_name}}/bootstrap.dart';
import 'package:{{project_name}}/navigator_key/nav_key.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  Keys.baseUrl = ProdConstants.backendBaseUrl;
  Keys.baseAuthUrl = ProdConstants.baseAuthUrl;
  Keys.authClientId = ProdConstants.authClientId;
  NavKey().showApiDebugger = false;
  await bootstrap( () => const App());
}

// Handle notifications when app is terminated
Future<void> backgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}
