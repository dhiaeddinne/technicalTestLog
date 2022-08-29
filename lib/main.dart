import 'package:flutter/material.dart';
import 'package:technical_test_logient/navigation/routes.dart' as route;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dhiaeddine Belkhiria',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: route.generateRoute,
      initialRoute: route.splashRoute,
    );
  }
}