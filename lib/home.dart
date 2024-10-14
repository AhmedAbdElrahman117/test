import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DraggableScrollableController controller = DraggableScrollableController();

  double currentSize = 0;
  bool isExpanded = false;
  @override
  void initState() {
    controller.addListener(
      () {
        if (controller.size > 0.2) {
          if (isExpanded != true) {
            isExpanded = true;
            setState(() {});
          }
        } else {
          if (isExpanded != false) {
            isExpanded = false;
            setState(() {});
          }
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.greenAccent,
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.13,
            minChildSize: 0.13,
            maxChildSize: 1,
            controller: controller,
            snap: true,
            builder: (context, scrollController) {
              return ListView(
                controller: scrollController,
                children: [
                  isExpanded
                      ? Container(
                          color: Colors.amber,
                          width: 500,
                          height: MediaQuery.sizeOf(context).height,
                          child: const Text('Expanded'),
                        )
                      : Container(
                          color: Colors.amber,
                          height: MediaQuery.sizeOf(context).height,
                          child: const Text('Collapsed'),
                        )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
