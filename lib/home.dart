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
            initialChildSize: 0.1,
            minChildSize: 0.1,
            maxChildSize: 1,
            controller: controller,
            snap: true,
            builder: (context, scrollController) {
              return CustomScrollView(
                controller: scrollController,
                slivers: [
                  isExpanded
                      ? const SliverFillRemaining(
                          child: SafeArea(
                            child: Card(
                              color: Colors.amber,
                              margin: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(),
                              elevation: 20,
                              child: Text('Expanded'),
                            ),
                          ),
                        )
                      : const SliverFillRemaining(
                          child: Card(
                            shape: RoundedRectangleBorder(),
                            margin: EdgeInsets.zero,
                            elevation: 20,
                            color: Colors.amber,
                            child: Text('Collapsed'),
                          ),
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
