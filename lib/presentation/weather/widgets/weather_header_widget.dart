import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather/domain/weather/entities/weather_entity.dart';

class WeatherHeaderWidget extends StatelessWidget {
  final WeatherEntity entity;

  const WeatherHeaderWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          toBeginningOfSentenceCase(
            DateFormat(
              'EEEE, d MMMM',
              Localizations.localeOf(context).languageCode,
            ).format(DateTime.now()),
          ),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 8),
        Text(entity.cityName, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
