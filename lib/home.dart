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
        child: Row(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  for (int i = 0; i < list.length; i++)
                    Positioned(
                      top: top += 30,
                      child: Draggable<String>(
                        data: list[i],
                        axis: Axis.horizontal,
                        feedback: Material(
                          child: Container(
                            width: 200,
                            height: 200,
                            color: Colors.accents[i],
                            child: Text(list[i]),
                          ),
                        ),
                        childWhenDragging: Material(
                          child: Container(
                            width: 200,
                            height: 200,
                            color: Colors.grey,
                            child: Text(list[i]),
                          ),
                        ),
                        child: Container(
                          width: 200,
                          height: 200,
                          color: Colors.accents[i],
                          child: Text(list[i]),
                        ),
                      ),
                    ),
                  Positioned(
                    top: 0,
                    right: MediaQuery.sizeOf(context).width * 0.9,
                    child: DragTarget<String>(
                      onAcceptWithDetails: (details) {
                        setState(() {
                          list.remove(details.data);
                        });
                      },
                      onWillAcceptWithDetails: (details) => true,
                      builder: (context, candidateData, rejectedData) {
                        return Container(
                          width: 200,
                          height: 500,
                          color: Colors.green,
                          child: Center(
                            child: Text(val),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
