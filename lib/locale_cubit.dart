import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/locale_states.dart';

class LocaleCubit extends Cubit<LocaleStates> {
  LocaleCubit() : super(LocaleInitial());
}
