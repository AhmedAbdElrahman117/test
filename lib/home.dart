import 'dart:math';

import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool enable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        enable = !enable;
        setState(() {});
      }),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return Skeletonizer(
              enabled: enable,
              ignoreContainers: true,
              ignorePointers: true,
              effect: ShimmerEffect(),
              enableSwitchAnimation: true,
              child: Card(
                child: ListTile(
                  title: Text('data'),
                  subtitle: Text('data'),
                  trailing: Icon(Icons.abc),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
