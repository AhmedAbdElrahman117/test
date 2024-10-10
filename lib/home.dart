import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    CarouselController controller = CarouselController(initialItem: 3);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: CarouselView(
                controller: controller,
                itemExtent: 200,
                children: [
                  Container(color: Colors.amber),
                  Container(color: Colors.black),
                  Container(color: Colors.yellow),
                ],
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {},
              child: Text('data'),
            ),
          ],
        ),
      ),
    );
  }
}
