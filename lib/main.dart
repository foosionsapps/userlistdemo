import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider_setup.dart';
import 'services/conectivity_service.dart';
import 'ui/screens/splash_screen.dart';
import 'routes/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: getProviders(),
      child: StreamProvider.controller(
        builder: (context) => ConnectivityService().connectionStatusController,
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          title: "PayEverDemo",
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          routes: {
//              '/': (_) => SplashScreen(),
          },
          onGenerateRoute: Router.generateRoute,
          onUnknownRoute: (settings) => MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

