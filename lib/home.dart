import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

@pragma("vm:entry-point")
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then(
      (value) {
        if (value) {
          log('Allowed');
        } else {
          log('Not Allowed');
          AwesomeNotifications().requestPermissionToSendNotifications(
            channelKey: 'basic',
            permissions: [
              NotificationPermission.Alert,
              NotificationPermission.Sound,
              NotificationPermission.Badge,
              NotificationPermission.Vibration,
              NotificationPermission.Light,
              NotificationPermission.OverrideDnD,
              NotificationPermission.Provisional,
              NotificationPermission.Car,
              NotificationPermission.FullScreenIntent,
            ],
          );
        }
      },
    );

    AwesomeNotifications().setListeners(
      onActionReceivedMethod: (receivedAction) async {
        log(receivedAction.body!);
      },
      onNotificationDisplayedMethod: (receivedNotification) async {
        log(receivedNotification.body!);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              await AwesomeNotifications()
                  .createNotification(
                content: NotificationContent(
                  id: 1,
                  channelKey: 'basic',
                  title: 'Hi',
                  body: 'I Sent A Notification',
                  duration: const Duration(seconds: 2),
                  actionType: ActionType.Default,
                  roundedBigPicture: true,
                  displayOnBackground: true,
                  fullScreenIntent: true,
                  notificationLayout: NotificationLayout.BigPicture,
                  wakeUpScreen: true,
                ),
              )
                  .then(
                (value) {
                  if (value) {
                    log('Sent');
                  } else {
                    log('Failed');
                  }
                },
              );
            },
            child: const Text('Send'),
          ),
        ),
      ),
    );
  }
}
