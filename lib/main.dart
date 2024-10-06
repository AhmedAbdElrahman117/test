import 'package:flutter/material.dart';
import 'package:flutter_paymob/flutter_paymob.dart';
import 'package:test/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterPaymob.instance.initialize(
    apiKey:
        'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RrNU16ZzNMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuZl9KY09XN3RJNFVYM0lnVkVxT2dpY29XcnVuVDV3MEtfVXdXejk3M1BIZk1sVURfVHNOSjN4cUQ2UF9fZ0R3cXZZczNTQXM3V0xDelM0dUJlQlBGeGc=',
    iFrameID: 873090,
    walletIntegrationId: 4849868,
    integrationID: 4849866,
  );
  runApp(const Test());
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
