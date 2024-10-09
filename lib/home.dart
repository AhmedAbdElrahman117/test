import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimateIfVisibleWrapper(
          showItemInterval: Duration(milliseconds: 500),
          child: ScrollablePositionedList.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return AnimateIfVisible(
                reAnimateOnVisibility: true,
                key: Key('k$index'),
                builder: (context, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height,
                      color: Colors.accents[index],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
