import 'package:flutter/material.dart';
import 'package:weather/domain/weather/entities/weather_entity.dart';
import 'package:weather/domain/weather/repositories/weather_repository_interface.dart';
import 'package:weather/domain/weather/use_cases/get_weather_by_city_use_case.dart';

final class WeatherProvider extends ChangeNotifier {
  final GetWeatherByCityUseCase _useCase;
  final WeatherRepositoryInterface _repository;

  bool _isLoading = false;

  String? _error;

  WeatherEntity? _weather;

  WeatherProvider(this._useCase, this._repository);

  WeatherEntity? get weather => _weather;

  bool get isLoading => _isLoading;

  String? get error => _error;

  Future<void> fetchWeather() async {
    _isLoading = true;

    _error = null;

    notifyListeners();

    try {
      String city = await _repository.getCurrentCity();

      _weather = await _useCase.execute(city);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;

      notifyListeners();
    }
  }
}
