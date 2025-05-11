import 'package:flutter/material.dart';
import 'package:weather/domain/weather/entities/weather_entity.dart';

class WeatherTemperatuteTextureWidget extends StatelessWidget {
  final WeatherEntity entity;

  const WeatherTemperatuteTextureWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${entity.temperature.round()}°C',
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
