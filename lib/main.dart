import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test/constants.dart';
import 'package:test/home.dart';
import 'package:test/locale_cubit.dart';
import 'generated/l10n.dart';

void main() {
  runApp(const Test());
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleCubit(),
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: BlocProvider.of<LocaleCubit>(context).currentLocale,
          localizationsDelegates: const [
            S.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home: const Home(),
        );
      }),
    );
  }
}
