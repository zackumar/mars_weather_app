import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars_weather_app/core/services/weather_service/weather_service_dio.dart';

import 'package:mars_weather_app/router.dart' as router;
import 'package:mars_weather_app/core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  setupServiceLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414.0, 896.0),
      allowFontScaling: true,
      builder: () => MaterialApp(
        title: 'Mars Weather App',
        theme: ThemeData(
          primaryColor: Color(0xFFFFFFFF),
          fontFamily: 'Montserrat',
        ),
        onGenerateRoute: router.generateRoute,
        initialRoute: router.HomeViewRoute,
      ),
    );
  }
}
