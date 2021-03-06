import 'package:dashboard/routes/routes.dart';
import 'package:dashboard/routes/routes_generator.dart';
import 'package:dashboard/ui/app_view.dart';
import 'package:flutter/material.dart';

class MyDashboard extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agencia de Viajes',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: (_, child) => AppView(
        child: child,
      ),
      initialRoute: routeDashboard,
      navigatorKey: navKey,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
