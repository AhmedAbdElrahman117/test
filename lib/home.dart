import 'package:flutter/material.dart';
import 'package:test/generated/l10n.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String current = 'en';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
      ),
      body: Row(
        children: [
          Flexible(
            child: RadioListTile(
              value: 'en',
              groupValue: current,
              onChanged: (value) {},
              title: Text('English'),
            ),
          ),
          Flexible(
            child: RadioListTile(
              value: 'ar',
              groupValue: current,
              onChanged: (value) {},
              title: Text('Arabic'),
            ),
          ),
        ],
      ),
    );
  }
}
