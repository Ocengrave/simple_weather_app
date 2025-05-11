import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:weather/core/locale/locale_provider.dart';
import 'package:weather/data/weather/datasources/contracts/weather_data_source_interface.dart';
import 'package:weather/data/weather/datasources/weather_remote_data_source.dart';
import 'package:weather/data/weather/repositories/weather_repository.dart';
import 'package:weather/domain/weather/services/contracts/weather_icon_provider_interface.dart';
import 'package:weather/domain/weather/services/weather_icon_provider.dart';
import 'package:weather/domain/weather/repositories/weather_repository_interface.dart';
import 'package:weather/domain/weather/use_cases/get_weather_by_city_use_case.dart';
import 'package:weather/presentation/weather/providers/weather_provider.dart';

List<SingleChildWidget> createProviders() {
  final Dio dio = Dio();

  return [
    // Dio instance
    Provider<Dio>(create: (_) => dio),

    ChangeNotifierProvider(create: (_) => LocaleProvider()),

    // Data Sources
    Provider<WeatherDataSourceInterface>(
      create:
          (context) => WeatherRemoteDataSource(
            context.read<Dio>(),
            context.read<LocaleProvider>(),
          ),
    ),

    // Repositories
    Provider<WeatherRepositoryInterface>(
      create:
          (context) =>
              WeatherRepository(context.read<WeatherDataSourceInterface>()),
    ),

    // Use cases
    Provider<GetWeatherByCityUseCase>(
      create:
          (context) => GetWeatherByCityUseCase(
            context.read<WeatherRepositoryInterface>(),
          ),
    ),

    // Providers
    Provider<WeatherIconProviderInterface>(
      create: (context) => WeatherIconProvider(),
    ),

    ChangeNotifierProvider<WeatherProvider>(
      create:
          (context) => WeatherProvider(
            context.read<GetWeatherByCityUseCase>(),
            context.read<WeatherRepositoryInterface>(),
          ),
    ),
  ];
}
