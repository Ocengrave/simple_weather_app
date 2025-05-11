import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather/domain/weather/entities/weather_entity.dart';
import 'package:weather/domain/weather/services/contracts/weather_icon_provider_interface.dart';

class WeatherAnimationWidget extends StatelessWidget {
  final WeatherEntity entity;
  final double height;

  const WeatherAnimationWidget({
    super.key,
    required this.entity,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final WeatherIconProviderInterface iconProvider =
        context.watch<WeatherIconProviderInterface>();

    return SizedBox(
      height: height,
      child: Lottie.asset(
        'assets/lottie/${iconProvider.getIcon(entity.condition)}.json',
      ),
    );
  }
}
