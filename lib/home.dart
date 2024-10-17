import 'package:clay_containers/clay_containers.dart';
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
            Center(
              child: ClayAnimatedContainer(
                duration: const Duration(milliseconds: 2000),
                curve: Curves.linear,
                color: Colors.grey.shade100,
                width: 250,
                height: 250,
                depth: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
