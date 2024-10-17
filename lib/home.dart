import 'package:fade_out_particle/fade_out_particle.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool animated = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeOutParticle(
              disappear: animated,
              duration: const Duration(milliseconds: 2000),
              child: const Center(
                child: Text(
                  'Hello Ahmed',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                animated = !animated;
                setState(() {});
              },
              child: const Text('Animate'),
            ),
          ],
        ),
      ),
    );
  }
}
