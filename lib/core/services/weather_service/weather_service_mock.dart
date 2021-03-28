import 'dart:async';

import 'package:mars_weather_app/core/services/weather_service.dart';

class WeatherServiceMock extends WeatherService {
  Map<String, dynamic> weatherMock = {
    'date': '2021-03-18',
    'sol': 3062,
    'max_c': -15,
    'min_c': -73,
    'pressure': 838,
    'atm_opacity': 'Sunny',
    'uv': 'moderate',
    'sunrise': '06:31',
    'sunset': '18:25',
    'location': 'Elysium Planitia',
  };

  bool _isCelsius = true;

  @override
  Future<dynamic> getMarsWeather() {
    Completer completer = Completer();
    completer.complete(weatherMock);
    return completer.future;
  }

  @override
  bool isCelsius() {
    return _isCelsius;
  }

  @override
  void setIsCelsius(bool isCelsius) {
    _isCelsius = isCelsius;
  }
}
