import 'package:flutter/material.dart';
import 'package:movies_app/src/pages/home_page.dart';
import 'package:movies_app/src/pages/welcome_page.dart';

Map<String, WidgetBuilder> getApplicationsRoutes() {
  return <String, WidgetBuilder>{
    'welcome': (BuildContext context) => WelcomePage(),
    'home' : (BuildContext context) => HomePage(),
  };
}
