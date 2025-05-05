import 'dart:io';
import 'package:bloc/bloc.dart';

part 'technical_work_event.dart';
part 'technical_work_state.dart';

class TechnicalWorkBloc extends Bloc<TechnicalWorkEvent, TechnicalWorkState> {
  TechnicalWorkBloc() : super(TechnicalWorkState()) {
    on<TechnicalWorkEventExitApp>(_exitApp);
  }

  void _exitApp(TechnicalWorkEventExitApp event, Emitter<TechnicalWorkState> emit) {
    exit(0);
  }
}