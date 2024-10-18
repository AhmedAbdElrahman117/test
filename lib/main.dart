import 'package:flutter/material.dart';
import 'package:splash_view/source/presentation/pages/pages.dart';
import 'package:splash_view/source/presentation/presentation.dart';
import 'package:test/home.dart';

void main() {
  runApp(const Test());
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(
        // backgroundColor: Colors.black,
        duration: const Duration(seconds: 1),
        logo: Container(color: Colors.amber, width: 200, height: 200),
        title: const Text(
          'UCCD',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        subtitle: const Text(
          'BTU',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        gradient: const LinearGradient(
          colors: [
            Colors.amberAccent,
            Colors.greenAccent,
          ],
        ),
        loadingIndicator: const Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
          child: CircularProgressIndicator.adaptive(),
        ),
        bottomLoading: true,
        showStatusBar: true,
        done: Done(
          const Home(),
          animationDuration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutBack,
        ),
      ),
    );
  }
}
