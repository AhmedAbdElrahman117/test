import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool animate = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                right: animate ? 200 : 0,
                child: Text('data'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 60),
                  ElevatedButton(
                    onPressed: () {
                      animate = !animate;
                      setState(() {});
                      Timer(
                        Duration(milliseconds: 600),
                        () {
                          animate = !animate;
                          setState(() {});
                        },
                      );
                    },
                    child: Text('Animate'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
