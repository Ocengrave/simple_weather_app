import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/core/error/weather_exception.dart';
import 'package:weather/core/locale/locale_provider.dart';
import 'package:weather/data/weather/datasources/contracts/weather_data_source_interface.dart';
import 'package:weather/data/weather/models/weather.dart';

final class WeatherRemoteDataSource implements WeatherDataSourceInterface {
  final Dio dio;
  final LocaleProvider localeProvider;

  WeatherRemoteDataSource(this.dio, this.localeProvider);

  @override
  Future<Weather> fetchWeather(String cityName) async {
    try {
      final String url = dotenv.get('WEATHER_API_URL');
      final String apiKey = dotenv.get('WEATHER_API_KEY');

      final response = await dio
          .get(
            url,
            queryParameters: {
              'q': cityName,
              'appid': apiKey,
              'units': 'metric',
              'lang': localeProvider.locale.languageCode,
            },
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode != 200) {
        throw WeatherException(
          'errros.weather.errorData',
          statusCode: response.statusCode,
          responseData: response.data,
        );
      }

      return Weather.fromJson(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw WeatherException(
          'errors.network.connectionTimeout',
          isNetworkError: true,
        );
      }

      if (e.type == DioExceptionType.connectionError) {
        throw WeatherException(
          'errors.network.connectionError',
          prevoius: e,
          isNetworkError: true,
        );
      }

      throw WeatherException(
        e.response?.data['message']?.toString() ?? 'errors.network.server',
        statusCode: e.response?.statusCode,
        prevoius: e,
        isNetworkError: true,
      );
    } on FormatException {
      throw WeatherException('errros.weather.errorData');
    } on Exception {
      throw WeatherException('errors.unknow');
    }
  }
}
