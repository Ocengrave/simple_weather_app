import 'package:weather/data/weather/models/weather.dart';

abstract interface class WeatherDataSourceInterface {
  Future<Weather> fetchWeather(String cityName);
}
