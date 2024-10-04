import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:test/home.dart';

void main() {
  AwesomeNotifications().initialize(
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
      ),
    ],
    debug: true,
  );
  runApp(const Test());
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
