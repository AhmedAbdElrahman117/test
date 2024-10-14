import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    OverlayPortalController controller = OverlayPortalController();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TextButton(
                onPressed: () => controller.toggle(),
                child: OverlayPortal(
                  controller: controller,
                  overlayChildBuilder: (context) {
                    return Stack(
                      alignment: Alignment.lerp(
                          Alignment.center, Alignment.bottomCenter, 0.2)!,
                      children: [
                        Container(
                          width: 200,
                          height: 40,
                          color: Colors.grey,
                          child: const Text(
                            'This is Overlay Portal',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
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
