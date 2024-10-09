import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  const SizedBox(width: 10),
                  SlidableAction(
                    onPressed: (context) {},
                    label: 'Share',
                    borderRadius: BorderRadius.circular(20),
                    backgroundColor: Colors.blue,
                    autoClose: false,
                    icon: Icons.share,
                  ),
                  const SizedBox(width: 10),
                  SlidableAction(
                    onPressed: (context) {},
                    label: 'Share',
                    borderRadius: BorderRadius.circular(20),
                    backgroundColor: Colors.blue,
                    autoClose: false,
                    icon: Icons.share,
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              child: const ListTile(
                title: Text('data'),
                tileColor: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
