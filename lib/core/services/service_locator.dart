import 'package:get_it/get_it.dart';
import 'package:mars_weather_app/core/services/weather_service.dart';
import 'package:mars_weather_app/core/services/weather_service/weather_service_dio.dart';
import 'package:mars_weather_app/core/services/weather_service/weather_service_mock.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() {
  locator.registerLazySingleton<WeatherService>(() => WeatherServiceDio());
}
