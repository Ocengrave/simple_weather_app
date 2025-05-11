import 'package:weather/domain/weather/entities/weather_entity.dart';

abstract interface class WeatherRepositoryInterface {
  Future<WeatherEntity> getWeatherByLocation(String cityName);

  Future<String> getCurrentCity();
}
