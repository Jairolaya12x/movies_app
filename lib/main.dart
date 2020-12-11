import 'package:flutter/material.dart';
import 'package:movies_app/src/providers/data_preferences.dart';
import 'package:movies_app/src/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dataPreferences = new DataPreferences();
  await dataPreferences.initPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: getApplicationsRoutes(),
      initialRoute: 'welcome',
      title: 'Movies App',
    );
  }
}