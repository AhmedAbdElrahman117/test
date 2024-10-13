import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> list = List.generate(10, (index) => 'H$index');

  String val = 'Drop Here';
  @override
  Widget build(BuildContext context) {
    double top = 0;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: list.asMap().entries.map(
                  (e) {
                    return Positioned(
                      top: top += 30,
                      child: Draggable<String>(
                        data: e.value,
                        axis: Axis.horizontal,
                        onDragCompleted: () {
                          print('object');
                        },
                        feedback: Material(
                          child: Container(
                            width: 200,
                            height: 200,
                            color: Colors.accents[e.key],
                            child: Text(e.value),
                          ),
                        ),
                        childWhenDragging: Material(
                          child: Container(
                            width: 200,
                            height: 200,
                            color: Colors.grey,
                            child: Text(e.value),
                          ),
                        ),
                        child: Container(
                          width: 200,
                          height: 200,
                          color: Colors.accents[e.key],
                          child: Text(e.value),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            DragTarget<String>(
              onAcceptWithDetails: (details) {
                val = details.data;
                setState(() {});
              },
              onWillAcceptWithDetails: (details) => true,
              builder: (context, candidateData, rejectedData) {
                return Container(
                  width: 200,
                  height: 200,
                  color: Colors.green,
                  child: Center(
                    child: Text(val),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
