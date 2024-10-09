import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ItemScrollController scrollController = ItemScrollController();
  ItemPositionsListener? positionsListener;
  int current = 12;
  bool isCurrent = false;

  @override
  void initState() {
    positionsListener = ItemPositionsListener.create()
      ..itemPositions.addListener(
        () {},
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          scrollController.scrollTo(
            index: current,
            duration: const Duration(milliseconds: 200),
          );
          isCurrent = !isCurrent;
          setState(() {});
          Timer(
            const Duration(milliseconds: 500),
            () {
              isCurrent = !isCurrent;
              setState(() {});
            },
          );
        },
      ),
      body: SafeArea(
        child: ScrollablePositionedList.builder(
          itemCount: 20,
          itemScrollController: scrollController,
          itemPositionsListener: positionsListener,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('data${index + 1}'),
              selected: current == index ? isCurrent : false,
              selectedTileColor: Colors.grey,
            );
          },
        ),
      ),
    );
  }
}
