import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/core/bloc/common_bloc.dart';
import 'package:test_app/core/services/database_service/database_service.dart';
import 'package:test_app/core/services/network_service/network_service.dart';
import 'package:test_app/core/services/push_notification_service/push_notification_service.dart';
import 'package:test_app/core/services/system_color_service.dart';
import 'package:test_app/enums/marketplace.dart';
import 'package:test_app/core/utils/app_config.dart';
import 'package:test_app/core/services/remote_config_service/firebase_remote_config_service.dart';
import 'package:test_app/features/loading_page/bloc/loading_page_bloc.dart';
import 'package:test_app/features/loading_page/loading_page.dart';
import 'package:test_app/features/loading_page/repository/loading_page_repository.dart';

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
          home: BlocProvider<LoadingPageBloc>(
            create: (context) => LoadingPageBloc(
                loadingPageRepository: LoadingPageRepository(
                    networkService: HTTPNetworkService()
                ),
                pushNotificationService: PushNotificationService()
            )..add(LoadingPageEventInit()),
            child: LoadingPage(),
          )
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