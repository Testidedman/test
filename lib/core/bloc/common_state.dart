part of 'common_bloc.dart';

class CommonState {
  final Color color;

  CommonState({
    this.color = const Color(0xff121A21)
  });

  CommonState copyWith({
    Color? color
  }) {
    return CommonState(
        color: color ?? this.color
    );
  }
}