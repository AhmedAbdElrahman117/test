import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/locale_states.dart';

class LocaleCubit extends Cubit<LocaleStates> {
  LocaleCubit() : super(LocaleInitial());

  Locale currentLocale = Locale('en');

  void changeLocale(String value) {
    currentLocale = Locale(value);
    emit(LocaleChanged());
  }
}
