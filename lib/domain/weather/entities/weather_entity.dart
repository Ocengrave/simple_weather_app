import 'package:weather/domain/weather/entities/weather_condition.dart';

final class WeatherEntity {
  final String cityName;
  final double temperature;
  final WeatherCondition condition;
  final String description;

  const WeatherEntity({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.description,
  });
}
