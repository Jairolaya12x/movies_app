import 'package:flutter/material.dart';
import 'package:movies_app/src/pages/welcome.dart';

Map<String, WidgetBuilder> getApplicationsRoutes() {
  return <String, WidgetBuilder>{
    'welcome': (BuildContext context) => WelcomePage(),
  };
}
