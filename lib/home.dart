import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Choose Payment Method'),
              ElevatedButton(
                onPressed: () {},
                child: Text('Card'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Wallet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
