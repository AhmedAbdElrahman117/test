import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              showOverlay(context);
            },
            child: Text('Show Overlay'),
          ),
        ),
      ),
    );
  }

  void showOverlay(BuildContext context) {
    OverlayEntry overlay = OverlayEntry(
      builder: (context) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Material(
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                decoration: BoxDecoration(color: Colors.transparent),
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    Overlay.of(context).insert(overlay);

    Timer(
      Duration(seconds: 2),
      () {
        overlay.remove();
      },
    );
  }
}
