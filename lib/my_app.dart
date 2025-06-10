import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/core/bloc/common_bloc.dart';
import 'package:test_app/core/services/app_router.dart';
import 'package:test_app/core/services/database/database_service/database_service.dart';
import 'package:test_app/core/services/injector/injector.dart';
import 'package:test_app/enums/marketplace.dart';
import 'package:test_app/core/utils/app_config.dart';
import 'package:test_app/core/services/remote_config_service/firebase_remote_config_service.dart';

void main() {
  initApp(
      AppConfig(
        remoteConfigService: FirebaseRemoteConfigService(),
        marketplace: Marketplace.googlePlay,
      )
  );
}

void initApp(AppConfig appConfig) async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  configureDependencies();
  await DataBaseService().init();
  GetIt.instance.registerSingleton<AppConfig>(appConfig);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final color = SystemColorService.getSystemColor(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<CommonBloc>(
          create: (BuildContext context) => CommonBloc()..add(
              CommonEventInit(color: Colors.black)
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: getIt<AppRouter>().config(),
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        builder: (context, child) {
          return child!;
        },
        // home: BlocProvider<UpdateAvailablePageBloc>(
        //   create: (context) => UpdateAvailablePageBloc(
        //     configService: GetIt.instance<AppConfig>().remoteConfigService,
        //   )..add(UpdateAvailablePageEventInit()),
        //   child: UpdateAvailablePage(),
        // )
        // switch (appStatus) {
        //   AppStatus.technicalWorks => BlocProvider(
        //       create: (context) => TechnicalWorkBloc(),
        //       child: TechnicalWorkPage(),
        //     ),
        //   AppStatus.updateAvailable => BlocProvider(
        //       create: (context) => UpdateAvailablePageBloc(
        //         configService: GetIt.instance<AppConfig>().remoteConfigService,
        //       ),
        //       child: UpdateAvailablePage(),
        //     ),
        //   AppStatus.needUpdate =>
        //     const MyHomePage(title: 'Flutter Demo Home Page2'),
        //   AppStatus.none => const MyHomePage(title: 'Flutter Demo Home Page3'),
        // },
      ),
    );
  }
}