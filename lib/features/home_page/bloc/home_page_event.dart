part of 'home_page_bloc.dart';

class HomePageEvent {}

class ChangePageEvent extends HomePageEvent {
  final int index;

  ChangePageEvent({
    required this.index
  });
}