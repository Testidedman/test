part of 'update_available_page_bloc.dart';

class UpdateAvailablePageEvent {}

class UpdateAvailablePageEventTapMarketPlace extends UpdateAvailablePageEvent {
  final Marketplace marketPlace;

  UpdateAvailablePageEventTapMarketPlace({
    required this.marketPlace
  });
}

class UpdateAvailablePageEventInit extends UpdateAvailablePageEvent {}