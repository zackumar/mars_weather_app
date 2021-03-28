import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mars_weather_app/ui/home/home_view.dart';
import 'package:mars_weather_app/ui/info/info_view.dart';

const String HomeViewRoute = '/home';
const String InfoViewRoute = '/info';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeViewRoute:
      return MaterialPageRoute(builder: (context) => HomeView());
    case InfoViewRoute:
      return CupertinoPageRoute(builder: (context) => InfoView());
    default:
      return MaterialPageRoute(builder: (context) => HomeView());
  }
}
