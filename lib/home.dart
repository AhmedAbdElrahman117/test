import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool enabled = false;
  @override
  void initState() {
    getPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
        future: FlutterContacts.getContacts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error');
          } else if (!snapshot.hasData) {
            return Text('No Data');
          } else {
            return ListTile(
              title: Text(snapshot.data!.first.displayName),
              subtitle: Text(snapshot.data!.first.name.firstPhonetic),
            );
          }
        },
      )),
    );
  }

  getPermission() async {
    if (await FlutterContacts.requestPermission()) {
      enabled = true;
      setState(() {});
    }
  }
}
