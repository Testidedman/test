part of 'update_available_page_bloc.dart';

class UpdateAvailablePageEvent {}

class UpdateAvailablePageEventTapMarketPlace extends UpdateAvailablePageEvent {
  final String marketPlace;

  UpdateAvailablePageEventTapMarketPlace({
    required this.marketPlace
  });
}