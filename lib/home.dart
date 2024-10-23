import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Badge(
              label: Text('Hot'),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notification_important,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
