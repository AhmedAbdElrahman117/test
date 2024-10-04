import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:test/firebase_options.dart';
import 'package:test/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        importance: NotificationImportance.Max,
        channelShowBadge: true,
        enableLights: true,
      ),
    ],
    debug: true,
  );
  await FirebaseMessaging.instance.setAutoInitEnabled(true);

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
