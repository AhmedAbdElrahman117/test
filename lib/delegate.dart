import 'package:flutter/material.dart';

class Delegate extends SearchDelegate<String> {
  List<String> data;
  Delegate(this.data);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear_rounded),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView(
      children: data.map(
        (e) {
          if (e.contains(query)) {
            return ListTile(
              title: Text(e),
            );
          } else {
            return Container();
          }
        },
      ).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: data.map(
        (e) {
          if (e.contains(query)) {
            return ListTile(
              title: Text(e),
            );
          } else {
            return Container();
          }
        },
      ).toList(),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }
}
