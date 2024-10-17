import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController controller1 = ScrollController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: SafeArea(
          child: BottomBar(
            clip: Clip.none,
            icon: (width, height) {
              return Center(
                child: IconButton(
                  onPressed: () {
                    controller1.animateTo(
                      controller1.position.minScrollExtent,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.bounceIn,
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                  ),
                ),
              );
            },
            showIcon: true,
            iconHeight: 40,
            iconWidth: 40,
            borderRadius: BorderRadius.circular(50),
            width: MediaQuery.sizeOf(context).width * 0.8,
            body: (context, controller) {
              controller1 = controller;
              return TabBarView(
                children: [
                  ListView.builder(
                    itemCount: 100,
                    controller: controller,
                    itemBuilder: (context, index) {
                      return Text(
                        'data $index',
                        style: TextStyle(fontSize: 30),
                      );
                    },
                  ),
                  Container(color: Colors.amberAccent),
                  Container(color: Colors.green),
                  Container(color: Colors.yellowAccent),
                ],
              );
            },
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                const TabBar(
                  tabAlignment: TabAlignment.fill,
                  tabs: [
                    SizedBox(
                      width: 40,
                      height: 55,
                      child: Center(child: Icon(Icons.home)),
                    ),
                    SizedBox(
                      width: 40,
                      height: 55,
                      child: Center(child: Icon(Icons.home)),
                    ),
                    SizedBox(
                      width: 40,
                      height: 55,
                      child: Center(child: Icon(Icons.home)),
                    ),
                    SizedBox(
                      width: 40,
                      height: 55,
                      child: Center(child: Icon(Icons.home)),
                    ),
                  ],
                ),
                Positioned(
                  top: -40,
                  child: FloatingActionButton(onPressed: () {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
