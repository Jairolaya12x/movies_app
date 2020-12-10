import 'package:flutter/material.dart';
import 'package:movies_app/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: getApplicationsRoutes(),
      initialRoute: 'home',
      title: 'Movies App',
    );
  }
}