import 'package:weather/domain/weather/entities/weather_condition.dart';

abstract interface class WeatherIconProviderInterface {
  String getIcon(WeatherCondition condition);
}
