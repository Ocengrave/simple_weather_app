import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/core/theme/app_theme_extension.dart';
import 'package:weather/core/theme/theme_provider.dart';
import 'package:weather/presentation/weather/providers/weather_provider.dart';
import 'package:weather/presentation/weather/widgets/weather_content_widget.dart';
import 'package:weather/presentation/weather/widgets/weather_error_widget.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherProvider>().fetchWeather();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final LinearGradient gradient =
        theme.extension<AppThemeExtension>()!.scaffoldGradient;

    final WeatherProvider weatherProvider = context.watch<WeatherProvider>();

    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Container(
      decoration: BoxDecoration(gradient: gradient),
      child: Scaffold(
        appBar:
            isLandscape == true
                ? null
                : AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    _buildRefreshButton(weatherProvider),
                    IconButton(
                      onPressed:
                          () => context.read<ThemeProvider>().toogleTheme(),
                      icon: Icon(
                        context.watch<ThemeProvider>().isDarkMode
                            ? Icons.light_mode
                            : Icons.dark_mode,
                      ),
                    ),
                  ],
                ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              // Вызываем метод обновления данных
              await context.read<WeatherProvider>().fetchWeather();
            },
            child: _buildBody(weatherProvider),
          ),
        ),
      ),
    );
  }

  Widget _buildRefreshButton(WeatherProvider provider) {
    return IconButton(
      icon:
          provider.isLoading
              ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
              : Icon(Icons.refresh),
      onPressed:
          provider.isLoading
              ? null
              : () => context.read<WeatherProvider>().fetchWeather(),
    );
  }

  Widget _buildBody(WeatherProvider weatherProvider) {
    if (weatherProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (weatherProvider.error != null) {
      return WeatherErrorWidget(message: weatherProvider.error!);
    }

    if (weatherProvider.weather != null) {
      return WeatherContentWidget(entity: weatherProvider.weather!);
    }

    // Fallback empty state
    return const SizedBox.shrink();
  }
}
