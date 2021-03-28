import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart';

import 'package:mars_weather_app/core/services/weather_service.dart';

class WeatherServiceDio extends WeatherService {
  Dio _dio;
  CookieJar _cookieJar;

  bool _isCelsius = true;

  WeatherServiceDio() {
    _dio = Dio();
    _cookieJar = CookieJar();

    _dio.options.connectTimeout = 10000;
    _dio.options.receiveTimeout = 3000;
    _dio.options.followRedirects = false;
    _dio.options.validateStatus = (status) {
      return status < 500;
    };
  }

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

  @override
  Future getMarsWeather() async {
    var marsweather = await _dio.get('http://24.160.14.106:3271/mars');

    var locationpage = await _dio.get('https://mars.nasa.gov/msl/weather/');
    var lDocument = parse(locationpage.data);

    String locationHeader =
        lDocument.querySelector('h1[class="textWhite textAlignLeft"]').text ??
            'at n/a';
    String locationString =
        locationHeader.substring(locationHeader.indexOf(' at') + 3).trim();

    print(locationString);

    Map<String, dynamic> weatherInfo = marsweather.data;
    weatherInfo['location'] = locationString;

    print(marsweather.data);

    return weatherInfo;
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
