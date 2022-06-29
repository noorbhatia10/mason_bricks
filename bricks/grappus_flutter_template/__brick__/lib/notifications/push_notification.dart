import 'dart:convert';
import 'dart:io';

import 'package:api_controller/api_controller.dart';
import 'package:app_ui/app_ui.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:{{project_name}}/navigator_key/nav_key.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initializeLocalNotificationService() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettingsIOS = IOSInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await _notificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (String? payload) async {
        /*  Handles notification tap when app is in foreground,
      if payload is null then nothing happens on notification tap
      as the app is already in foreground  */
        if (payload != null) {
          final remoteMessage = json.decode(payload) as Map<String, dynamic>;
          final dynamic taskId = remoteMessage['taskId'];
          final dynamic assistanceId = remoteMessage['assistanceId'];

          if (taskId != null) {
            Prefs.newSFRequest = true;
          } else if (assistanceId != null) {
            Prefs.newAssistanceRequest = true;
          }
          // final homePage = HomePage(
          //   taskId: taskId == null ? null : taskId as String,
          //   assistanceId: assistanceId == null ? null : assistanceId as String,
          // );
          // await NavKey().navKey.currentState!.pushReplacement<void, void>(
          //       RouteAnimationSlideFromRight(
          //         widget: homePage,
          //         shouldMaintainState: false,
          //       ),
          //     );
        }
      },
    );

    await requestNotificationPermission();

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  /*
   * The permission step is required for IOS devices.
   * */
  static Future<void> requestNotificationPermission() async {
    if (Platform.isIOS) {
      await FirebaseMessaging.instance
          .requestPermission(
        announcement: true,
        carPlay: true,
        criticalAlert: true,
      )
          .then((value) {
        debugPrint('Settings registered: ${value.toString()}');
      });
    }
  }

  //ignore:avoid_void_async
  static void createLocalNotification(RemoteMessage message) async {
    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      KNotifications.notificationChannelId,
      KNotifications.notificationChannelName,
      channelDescription: KNotifications.notificationChannelDescription,
      importance: Importance.max,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );

    const iOSPlatformChannelSpecifics = IOSNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await _notificationsPlugin.show(
      id,
      message.notification!.title,
      message.notification!.body,
      platformChannelSpecifics,
      payload: json.encode(message.data),
    );
  }

  static Future<void> onDidReceiveLocalNotification(
    int? id,
    String? title,
    String? body,
    String? payload,
  ) async {}
}
