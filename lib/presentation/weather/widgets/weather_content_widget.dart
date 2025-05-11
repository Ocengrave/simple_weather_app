import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather/domain/weather/entities/weather_entity.dart';
import 'package:weather/presentation/weather/widgets/weather_animation_widget.dart';
import 'package:weather/presentation/weather/widgets/weather_header_widget.dart';
import 'package:weather/presentation/weather/widgets/weather_temperatute_texture_widget.dart';

class WeatherContentWidget extends StatelessWidget {
  final WeatherEntity entity;
  final int forecastDays;

  const WeatherContentWidget({
    super.key,
    required this.entity,
    this.forecastDays = 14,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
              child:
                  constraints.maxWidth > 600
                      ? _buildWideLayout(context, constraints)
                      : _buildPortraitLayout(context),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPortraitLayout(BuildContext context) {
    return Column(
      children: [
        WeatherHeaderWidget(entity: entity),
        const SizedBox(height: 24),
        WeatherAnimationWidget(entity: entity, height: 200),
        const SizedBox(height: 24),
        _WeatherDescription(entity: entity),
        const SizedBox(height: 24),
        WeatherTemperatuteTextureWidget(entity: entity),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildWideLayout(BuildContext context, BoxConstraints constraints) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: WeatherHeaderWidget(entity: entity)),

            Expanded(
              child: Column(
                children: [
                  WeatherAnimationWidget(
                    entity: entity,
                    height: constraints.maxHeight * 0.4,
                  ),
                  const SizedBox(height: 16),
                  _WeatherDescription(entity: entity),
                ],
              ),
            ),
          ],
        ),
        WeatherTemperatuteTextureWidget(entity: entity),
        const SizedBox(height: 32),
      ],
    );
  }
}

class _WeatherDescription extends StatelessWidget {
  final WeatherEntity entity;

  const _WeatherDescription({required this.entity});

  @override
  Widget build(BuildContext context) {
    return Text(
      toBeginningOfSentenceCase(entity.description),
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
