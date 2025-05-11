import 'package:weather/domain/weather/entities/weather_entity.dart';
import 'package:weather/domain/weather/repositories/weather_repository_interface.dart';

final class GetWeatherByCityUseCase {
  final WeatherRepositoryInterface _repository;

  GetWeatherByCityUseCase(this._repository);

  Future<WeatherEntity> execute(String cityName) async {
    return await _repository.getWeatherByLocation(cityName);
  }
}
