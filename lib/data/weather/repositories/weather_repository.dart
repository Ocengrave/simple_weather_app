import 'dart:async';

import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/core/error/location_exception.dart';
import 'package:weather/data/weather/datasources/contracts/weather_data_source_interface.dart';
import 'package:weather/data/weather/models/weather.dart';
import 'package:weather/domain/weather/entities/weather_entity.dart';
import 'package:weather/domain/weather/repositories/weather_repository_interface.dart';

final class WeatherRepository implements WeatherRepositoryInterface {
  final WeatherDataSourceInterface dataSource;

  WeatherRepository(this.dataSource);

  @override
  Future<WeatherEntity> getWeatherByLocation(String cityName) async {
    final Weather model = await dataSource.fetchWeather(cityName);

    return model.toEntity();
  }

  @override
  Future<String> getCurrentCity() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw LocationException('errors.weather.locationDenied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw LocationException('errors.weather.locationDeniedForever');
      }

      final position = await Geolocator.getCurrentPosition().timeout(
        const Duration(seconds: 10),
      );

      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      ).timeout(const Duration(seconds: 5));

      final city = placemarks.firstOrNull?.locality;

      if (city == null || city.isEmpty) {
        throw LocationException('errors.weather.cityDetectionFailed');
      }

      return city;
    } on TimeoutException {
      throw LocationException('errors.weather.locationTimeout');
    } on PlatformException catch (e) {
      throw LocationException(
        'errors.weather.unknownLocationError',
        technicalDetails: e.toString(),
      );
    } catch (e) {
      throw LocationException(
        'errors.weather.unknownLocationError',
        technicalDetails: e.toString(),
      );
    }
  }
}
