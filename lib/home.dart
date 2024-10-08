import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/generated/l10n.dart';
import 'package:test/locale_cubit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String current = 'en';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
      ),
      body: Row(
        children: [
          Flexible(
            child: RadioListTile(
              value: 'en',
              groupValue: current,
              onChanged: (value) {
                current = value!;
                BlocProvider.of<LocaleCubit>(context).changeLocale(value);
                setState(() {});
              },
              title: Text('English'),
            ),
          ),
          Flexible(
            child: RadioListTile(
              value: 'ar',
              groupValue: current,
              onChanged: (value) {
                current = value!;
                BlocProvider.of<LocaleCubit>(context).changeLocale(value);
                setState(() {});
              },
              title: Text('Arabic'),
            ),
          ),
        ],
      ),
    );
  }
}
