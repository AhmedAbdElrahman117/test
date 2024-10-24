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
          children: [
            SelectableText(
              'HiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHiHi',
              style: TextStyle(fontSize: 30),
              showCursor: true,
              cursorColor: Colors.green,
              cursorHeight: 30,
              cursorRadius: Radius.circular(12),
              cursorWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
