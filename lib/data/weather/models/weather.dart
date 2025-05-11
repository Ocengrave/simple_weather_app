import 'package:weather/domain/weather/entities/weather_condition.dart';
import 'package:weather/domain/weather/entities/weather_entity.dart';

final class Weather {
  final String cityName;
  final double temperature;
  final String mainCondition;
  final String description;

  const Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.description,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      mainCondition: (json['weather'][0]['main'] as String).toLowerCase(),
      description: (json['weather'][0]['description'] as String).toLowerCase(),
    );
  }

  WeatherEntity toEntity() {
    return WeatherEntity(
      cityName: cityName,
      temperature: temperature,
      condition: _mapCondition(mainCondition),
      description: description,
    );
  }

  WeatherCondition _mapCondition(String apiCondition) {
    return switch (apiCondition) {
      'clear' => WeatherCondition.clear,
      'clouds' => WeatherCondition.clouds,
      'rain' => WeatherCondition.rain,
      'snow' => WeatherCondition.snow,
      'thunderstorm' => WeatherCondition.thunderstorm,
      'drizzle' => WeatherCondition.drizzle,
      'fog' => WeatherCondition.fog,
      'mist' => WeatherCondition.fog,
      _ => WeatherCondition.unknown,
    };
  }
}
