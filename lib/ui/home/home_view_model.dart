import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mars_weather_app/core/services/service_locator.dart';
import 'package:mars_weather_app/core/services/weather_service.dart';
import 'package:mars_weather_app/router.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  var _context;

  Future future;

  dynamic _weatherInfo;
  dynamic get weatherInfo => _weatherInfo;

  String date;
  String sol;

  String min;
  String max;

  int pressure;
  String atmOpacity;
  String uvIndex;

  String sunrise;
  String sunset;

  String location;

  bool isCelsius;

  WeatherService _mars = locator<WeatherService>();

  void init(context) async {
    _context = context;
    isCelsius = _mars.isCelsius();
    future = getWeather();
  }

  Future<void> getWeather() async {
    _weatherInfo = await _mars.getMarsWeather();

    var dateString = _weatherInfo['date'];
    var dateTime = DateTime.parse(dateString);
    date = DateFormat('MMM d, y').format(dateTime);

    sol = _weatherInfo['sol'].toString();

    var minC = _weatherInfo['min_c'];
    var maxC = _weatherInfo['max_c'];

    if (!isCelsius) {
      min = ((minC * 9.0 / 5) + 32).round().toString();
      max = ((maxC * 9.0 / 5) + 32).round().toString();
    } else {
      min = minC.toString();
      max = maxC.toString();
    }

    pressure = _weatherInfo['pressure'];
    atmOpacity = _weatherInfo['atm_opacity'];

    var uv = _weatherInfo['uv'];
    uvIndex = '${uv[0].toUpperCase()}${uv.substring(1)}';

    sunrise = _weatherInfo['sunrise'];
    sunset = _weatherInfo['sunset'];

    location = _weatherInfo['location'];
  }

  void toggleUnit() {
    isCelsius = !isCelsius;

    var minC = _weatherInfo['min_c'];
    var maxC = _weatherInfo['max_c'];

    if (!isCelsius) {
      min = ((minC * 9.0 / 5) + 32).round().toString();
      max = ((maxC * 9.0 / 5) + 32).round().toString();
    } else {
      min = minC.toString();
      max = maxC.toString();
    }

    notifyListeners();
  }

  void infoButton() {
    Navigator.pushNamed(_context, InfoViewRoute);
  }
}
