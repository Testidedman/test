import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/technical_work/bloc/technical_work_bloc.dart';
import 'package:test_app/features/technical_work/technical_work_page.dart';
import 'package:test_app/features/update_available_page/bloc/update_available_page_bloc.dart';
import 'package:test_app/features/update_available_page/update_available_page.dart';
import 'package:test_app/models/version_model.dart';
import 'package:test_app/services/appmetrica_service.dart';
import 'package:test_app/services/firebase_service.dart';
import 'package:test_app/services/remote_config_service/remote_config_service.dart';

void initApp(RemoteConfigService configService) async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.init();
  await configService.init();
  final appStatus = await configService.getAppStatus();
  await AppmetricaService.initialization();
  runApp(MyApp(
    appStatus: appStatus,
    configService: configService,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key, required this.appStatus, required this.configService});

  final AppStatus appStatus;
  final RemoteConfigService configService;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: switch (appStatus) {
        AppStatus.technicalWorks => BlocProvider(
          create: (context) => TechnicalWorkBloc(),
          child: TechnicalWorkPage(),
        ),
        AppStatus.updateAvailable => BlocProvider(
          create: (context) => UpdateAvailablePageBloc(
            configService: configService,
          ),
          child: UpdateAvailablePage(),
        ),
        AppStatus.needUpdate => const MyHomePage(title: 'Flutter Demo Home Page2'),
        AppStatus.none => const MyHomePage(title: 'Flutter Demo Home Page3'),
      },
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