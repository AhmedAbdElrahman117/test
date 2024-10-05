import 'package:flutter/material.dart';
import 'package:test/home.dart';
import 'package:test/notification_controller.dart';

void main() async {
  NotificationController.notificationController.initFirebaseCloudMessaging();
  NotificationController.notificationController.initNotificationPackage();
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
