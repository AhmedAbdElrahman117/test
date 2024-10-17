import 'package:flutter/material.dart';
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
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.amber,
          centerTitle: true,
          elevation: 20,
        ),
      ),
      home: Home(),
    );
  }
}
