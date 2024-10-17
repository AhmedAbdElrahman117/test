import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController controller1 = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            QrImageView(
              data: 'Hello World',
              backgroundColor: Colors.amber,
              size: 400,
              version: QrVersions.auto,
              embeddedImage: NetworkImage(
                  'https://www.shutterstock.com/image-vector/letter-qr-logo-design-vector-260nw-1445885003.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}
