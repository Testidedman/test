import 'dart:ui';
import 'package:bloc/bloc.dart';

part 'common_event.dart';
part 'common_state.dart';

class CommonBloc extends Bloc<CommonEvent, CommonState> {
  CommonBloc() : super(CommonState()) {
    on<CommonEventInit>(_init);
  }

  void _init(CommonEventInit event, Emitter<CommonState> emit) {
    emit(state.copyWith(color: event.color));
  }
}
