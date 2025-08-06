// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../features/book_page/bloc/book_page_bloc.dart' as _i417;
import '../../../features/book_page/repository/book_page_repository.dart'
    as _i854;
import '../../../features/favourites_page/bloc/favourites_page_bloc.dart'
    as _i227;
import '../../../features/favourites_page/repository/favourites_page_repository.dart'
    as _i590;
import '../../../features/loading_page/bloc/loading_page_bloc.dart' as _i158;
import '../../../features/loading_page/repository/loading_page_repository.dart'
    as _i439;
import '../../../features/log_in_page/bloc/log_in_page_bloc.dart' as _i930;
import '../../../features/log_in_page/repository/Ilog_in_page_repository.dart'
    as _i915;
import '../../../features/log_in_page/repository/log_in_page_repository.dart'
    as _i438;
import '../../../features/main_page/bloc/main_page_bloc.dart' as _i235;
import '../../../features/main_page/repository/main_page_repository.dart'
    as _i462;
import '../../utils/services_module.dart' as _i701;
import '../app_router.dart' as _i482;
import '../database/book_model_table/book_model_dao.dart' as _i702;
import '../database/database.dart' as _i660;
import '../database/favourites_table/favourites_dao.dart' as _i919;
import '../network_service/network_service.dart' as _i363;
import '../push_notification_service/ipush_notification_service.dart' as _i451;
import '../push_notification_service/push_notification_service.dart' as _i407;
import '../storage_service.dart' as _i350;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final serviceModule = _$ServiceModule();
    gh.singleton<_i482.AppRouter>(() => _i482.AppRouter());
    gh.singleton<_i660.Database>(() => _i660.Database());
    gh.singleton<_i558.FlutterSecureStorage>(() => serviceModule.secureStorage);
    gh.factory<_i363.INetworkService>(() => _i363.HTTPNetworkService());
    gh.factory<_i451.IPushNotificationService>(
        () => _i407.PushNotificationService());
    gh.singleton<_i702.BookModelDao>(
        () => serviceModule.getBookModelDao(gh<_i660.Database>()));
    gh.singleton<_i919.FavouritesDao>(
        () => serviceModule.getFavouritesDao(gh<_i660.Database>()));
    gh.factory<_i350.IStorageService>(
        () => _i350.StorageService(gh<_i558.FlutterSecureStorage>()));
    gh.factory<_i854.IBookPageRepository>(() =>
        _i854.BookPageRepository(networkService: gh<_i363.INetworkService>()));
    gh.factory<_i590.IFavouritesPageRepository>(() =>
        _i590.FavouritesPageRepository(
            favouritesDao: gh<_i919.FavouritesDao>()));
    gh.factory<_i417.BookPageBloc>(() => _i417.BookPageBloc(
          bookPageRepository: gh<_i854.IBookPageRepository>(),
          favouritesDao: gh<_i919.FavouritesDao>(),
        ));
    gh.factory<_i439.ILoadingPageRepository>(() => _i439.LoadingPageRepository(
          networkService: gh<_i363.INetworkService>(),
          storageService: gh<_i350.IStorageService>(),
        ));
    gh.factory<_i915.ILogInPageRepository>(() => _i438.LogInPageRepository(
          networkService: gh<_i363.INetworkService>(),
          storageService: gh<_i350.IStorageService>(),
        ));
    gh.factory<_i930.LogInPageBloc>(() => _i930.LogInPageBloc(
        logInPageRepository: gh<_i915.ILogInPageRepository>()));
    gh.factory<_i158.LoadingPageBloc>(() => _i158.LoadingPageBloc(
          loadingPageRepository: gh<_i439.ILoadingPageRepository>(),
          pushNotificationService: gh<_i451.IPushNotificationService>(),
        ));
    gh.factory<_i462.IMainPageRepository>(() => _i462.MainPageRepository(
          networkService: gh<_i363.INetworkService>(),
          bookModelDao: gh<_i702.BookModelDao>(),
        ));
    gh.factory<_i227.FavouritesPageBloc>(() => _i227.FavouritesPageBloc(
        favouritesPageRepository: gh<_i590.IFavouritesPageRepository>()));
    gh.factory<_i235.MainPageBloc>(() => _i235.MainPageBloc(
        mainPageRepository: gh<_i462.IMainPageRepository>()));
    return this;
  }
}

class _$ServiceModule extends _i701.ServiceModule {}
