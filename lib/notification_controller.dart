import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:test/firebase_options.dart';

class NotificationController {
  NotificationController._();

  static NotificationController notificationController =
      NotificationController._();

//added first in main
  void initFirebaseCloudMessaging() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
  }

//added second in main
  void initNotificationPackage() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'basic',
          channelName: 'basic_channel',
          channelDescription: 'Notification Channel',
          defaultRingtoneType: DefaultRingtoneType.Notification,
          playSound: true,
          criticalAlerts: true,
          enableVibration: true,
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          enableLights: true,
        ),
      ],
      debug: true,
    );
  }

//added in home initState
  void setPackageListeners() async {
    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: (receivedAction) async {},
      onNotificationDisplayedMethod: (receivedNotification) async {},
    );
  }

//added in home initState
  void requestUserPermission() async {
    AwesomeNotifications().isNotificationAllowed().then(
      (value) {
        if (value) {
          FirebaseMessaging.onMessage.listen(
            (event) {
              AwesomeNotifications().createNotification(
                content: NotificationContent(
                  id: 1,
                  channelKey: 'basic',
                  title: event.notification!.title,
                  body: event.notification!.body,
                  duration: const Duration(seconds: 2),
                  actionType: ActionType.Default,
                  roundedBigPicture: true,
                  displayOnBackground: true,
                  fullScreenIntent: true,
                  notificationLayout: NotificationLayout.BigPicture,
                  wakeUpScreen: true,
                ),
              );
            },
          );
        } else {
          AwesomeNotifications()
              .requestPermissionToSendNotifications(channelKey: 'basic');
        }
      },
    );
  }
}
