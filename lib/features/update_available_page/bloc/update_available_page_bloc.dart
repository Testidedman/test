import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/core/models/feature_model.dart';
import 'package:test_app/core/models/version_model.dart';
import 'package:test_app/core/services/remote_config_service/remote_config_service.dart';
import 'package:test_app/enums/marketplace.dart';
import 'package:url_launcher/url_launcher.dart';

part 'update_available_page_event.dart';
part 'update_available_page_state.dart';

class UpdateAvailablePageBloc extends Bloc<UpdateAvailablePageEvent, UpdateAvailablePageState> {
  UpdateAvailablePageBloc({
    required final RemoteConfigService configService
  }): _configService = configService,
        super(UpdateAvailablePageState()) {
    on<UpdateAvailablePageEventTapMarketPlace>(_tapMarketPlace);
    on<UpdateAvailablePageEventInit>(_init);
  }


  final RemoteConfigService _configService;

  Future<void> _init(
      UpdateAvailablePageEventInit event,
      Emitter<UpdateAvailablePageState> emit
      ) async {
    final getIt = GetIt.instance;
    final String version = getIt<VersionModel>().version;
    final List<FeatureModel> features = getIt<VersionModel>().features;
    emit(state.copyWith(version: version, features: features));
  }

  Future<void> _tapMarketPlace(
      UpdateAvailablePageEventTapMarketPlace event,
      Emitter<UpdateAvailablePageState> emit
      ) async {
    try {
      final String url = await _configService.getMarketPlaceURL(event.marketPlace);
      launchUrl(Uri.parse(url));
    }
    catch (_) {
      if (state.isError) return;

      emit(state.copyWith(isError: true));
      await Future.delayed(Duration(seconds: 4));
      emit(state.copyWith(isError: false));
    }
  }
}