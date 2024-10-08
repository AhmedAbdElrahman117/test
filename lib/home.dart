import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar.medium(
                backgroundColor: Colors.amber,
              ),
            ];
          },
          body: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) {
              return Text(
                'data$index',
                style: const TextStyle(fontSize: 24),
              );
            },
          ),
        ),
      ),
    );
  }
}
