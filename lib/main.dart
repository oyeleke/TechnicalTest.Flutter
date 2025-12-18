import 'package:flutter/material.dart';
import 'package:flutter_tech_task/app/app.router.dart';
import 'package:flutter_tech_task/data/services/database_service.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await locator<DatabaseService>().initializeDb();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      localizationsDelegates: const [
        S.delegate,
      ],
      locale: const Locale('en'),
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
