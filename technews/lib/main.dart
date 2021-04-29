import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/services/rest_api_service.dart';
import 'views/components/splash_screen.dart';
import 'constants/api_path.dart';
import 'views/screens/home.dart';
import 'utils/themes/theme_config.dart';
import 'package:workmanager/workmanager.dart';


void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {

    print("Native called background task");
    // the update news response will be emitted here

    News().fetchData(UrlProvider().geturl());


    return Future.value(true);
  });
}


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(
    callbackDispatcher, // The top level function, aka callbackDispatcher
    isInDebugMode: true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
  );
  Workmanager().registerPeriodicTask("1", "Apiservice", frequency: Duration(minutes: 15), );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider < ThemeNotifier > (create: (_) => ThemeNotifier()),
      ChangeNotifierProvider < News > (create: (_) => News()),
      ChangeNotifierProvider < UrlProvider > (create: (_) => UrlProvider()),
    ],
    child: MyApp(),
  ), );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of < ThemeNotifier > (context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: themeNotifier.themeData,
      routes: {
        '/HomeScreen': (context) => HomeScreen(),
      },
      home: SplashScreen(),
    );
  }
}