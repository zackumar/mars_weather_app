abstract class WeatherService {
  Future<dynamic> getMarsWeather();

  bool isCelsius();
  void setIsCelsius(bool isCelsius);
}
