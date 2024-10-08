import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test/constants.dart';
import 'package:test/generated/l10n.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
      ),
      body: Column(
        children: [
          DropdownMenu(
            onSelected: (value) {
              current = Locale(value ?? 'en');
              S.load(current);
              setState(() {});
            },
            dropdownMenuEntries: [
              DropdownMenuEntry(
                value: 'en',
                label: 'English',
                enabled: true,
              ),
              DropdownMenuEntry(
                value: 'ar',
                label: 'Arabic',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
