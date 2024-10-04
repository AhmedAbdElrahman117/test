import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
          log('Not Allowed');
          AwesomeNotifications()
              .requestPermissionToSendNotifications(channelKey: 'basic');
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
            onPressed: () async {},
            child: const Text('Send'),
          ),
        ),
      ),
    );
  }
}
