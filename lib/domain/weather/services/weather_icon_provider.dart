import 'package:weather/domain/weather/services/contracts/weather_icon_provider_interface.dart';
import 'package:weather/domain/weather/entities/weather_condition.dart';

final class WeatherIconProvider implements WeatherIconProviderInterface {
  @override
  String getIcon(WeatherCondition condition) {
    return switch (condition) {
      WeatherCondition.clear => 'clear',
      WeatherCondition.clouds => 'clouds',
      WeatherCondition.thunderstorm => 'thunderstorm',
      WeatherCondition.drizzle => 'drizzle',
      WeatherCondition.rain => 'rain',
      WeatherCondition.snow => 'snow',
      WeatherCondition.sunny => 'sunny',
      WeatherCondition.mist ||
      WeatherCondition.smoke ||
      WeatherCondition.haze ||
      WeatherCondition.dust ||
      WeatherCondition.fog ||
      WeatherCondition.sand ||
      WeatherCondition.ash ||
      WeatherCondition.squall ||
      WeatherCondition.tornado => 'atmosphere',
      WeatherCondition.extreme => 'extreme',
      WeatherCondition.additional => 'additional',
      WeatherCondition.unknown => 'unknown',
    };
  }
}
