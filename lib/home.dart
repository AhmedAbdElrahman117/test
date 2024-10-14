import 'package:flutter/material.dart';
import 'package:test/Fade%20Animation.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  OverlayPortalController controller = OverlayPortalController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TextButton(
                onPressed: () {
                  controller.toggle();
                  setState(() {});
                },
                child: OverlayPortal(
                  controller: controller,
                  overlayChildBuilder: (context) {
                    return FadeAnimation(
                      animationDuration: const Duration(milliseconds: 500),
                      begin: 0,
                      end: 1,
                      child: Stack(
                        alignment: Alignment.lerp(
                            Alignment.center, Alignment.bottomCenter, 0.2)!,
                        children: const [
                          Card(
                            color: Colors.grey,
                            elevation: 20,
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'This is Overlay Portal',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    'data',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
