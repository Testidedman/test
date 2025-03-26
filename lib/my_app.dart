import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/core/bloc/common_bloc.dart';
import 'package:test_app/core/services/download_service.dart';
import 'package:test_app/core/services/firebase_service.dart';
import 'package:test_app/core/services/remote_config_service/remote_config_service.dart';
import 'package:test_app/core/services/system_color_service.dart';
import 'package:test_app/enums/app_status.dart';
import 'package:test_app/enums/marketplace.dart';
import 'package:test_app/core/utils/app_config.dart';
import 'package:test_app/core/services/appmetrica_service.dart';
import 'package:test_app/core/services/remote_config_service/firebase_remote_config_service.dart';
import 'package:test_app/features/settings_page/settings_page.dart';
import 'package:test_app/features/settings_page/widgets/colors_page/colors_page.dart';

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
  await DownloadService.init();
  await FirebaseService.init();
  GetIt.instance.registerSingleton<AppConfig>(appConfig);
  final RemoteConfigService remoteConfigService = appConfig.remoteConfigService;
  await remoteConfigService.init();
  final AppStatus appStatus = await remoteConfigService.getAppStatus();
  await AppmetricaService.init();
  runApp(MyApp(appStatus: appStatus));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.appStatus,
  });

  final AppStatus appStatus;

  @override
  Widget build(BuildContext context) {
    final color = SystemColorService.getSystemColor(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<CommonBloc>(
          create: (BuildContext context) => CommonBloc()..add(
              CommonEventInit(color: color)
          ),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: SettingsPage()
        // BlocProvider(
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}