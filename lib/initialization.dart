import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:volunteer_work_app/ui/pages/common_pages/list_conversations_page.dart';
import 'package:volunteer_work_app/ui/pages/common_pages/login_page.dart';
import 'package:volunteer_work_app/ui/pages/common_pages/notifications_page.dart';

import 'firebase_options.dart';
import 'main.dart';
import 'ui/common_components/snack_bars.dart';
import 'utils/fcm_model.dart';

class Initialization {
  static Future<void> initFirebaseMessaging() async {
    await _setupFirebaseMessagingConfigs();
  }
}

Future<void> _setupFirebaseMessagingConfigs() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    sound: true,
    badge: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );

    FirebaseMessaging.onMessage.listen((remoteMessage) {
      debugPrint(
          'Handling a foreground message: ${remoteMessage.data.toString()}');

      if (appNavigatorKey.currentContext != null) {
        if (Platform.isAndroid) {
          showInnerNotification(
            context: appNavigatorKey.currentContext!,
            title: remoteMessage.notification?.title ?? '-',
            message: remoteMessage.notification?.body ?? '-',
            onPressed: remoteMessage.data['page'] == null
                ? null
                : () => handleMessageAction(remoteMessage.data),
            seconds: 10,
          );
        }
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) {
      handleMessageAction(remoteMessage.data);
    });

    FirebaseMessaging.onBackgroundMessage(
      _firebaseMessagingBackgroundHandler,
    );
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage remoteMessage) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  debugPrint('Handling a background message: ${remoteMessage.data.toString()}');
}

Future<void> handleMessageAction(Map<String, dynamic>? payload) async {
  if (payload != null && payload['page'] != null) {
    if (appNavigatorKey.currentContext != null) {
      if (globalAppStorage.getAccessToken().isNotEmpty) {
        FCMModel fcmModelMessage = FCMModel.fromJson(payload);

        switch (fcmModelMessage.page) {
          case FirebaseMessagePageEnum.home:
            Navigator.of(appNavigatorKey.currentContext!).push(
                MaterialPageRoute(builder: (ctx) => determineHome()));
            break;
          case FirebaseMessagePageEnum.notification:
            Navigator.of(appNavigatorKey.currentContext!).push(
                MaterialPageRoute(builder: (ctx) => determineHome()));
            Navigator.of(appNavigatorKey.currentContext!).push(
                MaterialPageRoute(builder: (ctx) => const NotificationsPage()));
            break;
          case FirebaseMessagePageEnum.chats:
            Navigator.of(appNavigatorKey.currentContext!).push(
                MaterialPageRoute(builder: (ctx) => determineHome()));
            Navigator.of(appNavigatorKey.currentContext!).push(
                MaterialPageRoute(builder: (ctx) => const ListConversationsPage()));
            break;
          default:
            break;
        }
      } else {
        Navigator.of(appNavigatorKey.currentContext!)
            .push(MaterialPageRoute(builder: (ctx) => const LoginPage()));
      }
    }
  }
}
