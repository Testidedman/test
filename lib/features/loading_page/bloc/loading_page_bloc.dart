import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/core/services/appmetrica_service.dart';
import 'package:test_app/core/services/download_service.dart';
import 'package:test_app/core/services/firebase_service.dart';
import 'package:test_app/core/services/remote_config_service/remote_config_service.dart';
import 'package:test_app/core/utils/app_config.dart';
import 'package:test_app/enums/app_status.dart';
import 'package:test_app/features/loading_page/repository/loading_page_repository.dart';

part 'loading_page_event.dart';
part 'loading_page_state.dart';

class LoadingPageBloc extends Bloc<LoadingPageEvent, LoadingPageState> {
  LoadingPageBloc({required final ILoadingPageRepository loadingPageRepository})
      : _loadingPageRepository = loadingPageRepository,
        super(LoadingPageState()) {
    on<LoadingPageEventInit>(_init);
  }

  final ILoadingPageRepository _loadingPageRepository;

  Future<void> _init(
      LoadingPageEventInit event,
      Emitter<LoadingPageState> emit
      ) async {
    await DownloadService.init();
    await FirebaseService.init();
    final RemoteConfigService remoteConfigService = GetIt.instance<AppConfig>().remoteConfigService;
    await remoteConfigService.init();
    final AppStatus appStatus = await remoteConfigService.getAppStatus();
    await AppmetricaService.init();
    await _loadingPageRepository.getHealthCheck();
    emit(state.copyWith(appStatus: appStatus));
  }
}