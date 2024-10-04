import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

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
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
