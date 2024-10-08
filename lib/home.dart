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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedDefaultTextStyle(
                style:
                    TextStyle(fontSize: animate ? 50 : 20, color: Colors.black),
                duration: Duration(milliseconds: 500),
                child: Text('data'),
              ),
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
        ),
      ),
    );
  }
}
