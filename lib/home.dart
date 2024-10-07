import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> items = List.generate(50, (index) => 'Item ${index + 1}');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ReorderableListView(
          proxyDecorator: (child, index, animation) {
            return AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return FadeTransition(
                  opacity: animation,
                  child: Transform.scale(
                    alignment: Alignment.centerLeft,
                    scale: 1.2,
                    child: Card(
                      elevation: 20,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        child: Text(
                          items[index],
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          children: items
              .asMap()
              .entries
              .map(
                (e) => ListTile(
                  key: Key('${e.key}'),
                  title: Text(
                    e.value,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
              .toList(),
          onReorder: (oldIndex, newIndex) {
            setState(() {
              String item = items.removeAt(oldIndex);
              items.insert(newIndex, item);
            });
          },
        ),
      ),
    );
  }
}
