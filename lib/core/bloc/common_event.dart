part of 'common_bloc.dart';

abstract class CommonEvent {}

class CommonEventInit extends CommonEvent {
  final Color color;

  CommonEventInit({required this.color});
}