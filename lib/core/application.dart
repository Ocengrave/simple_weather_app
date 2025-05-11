import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/core/locale/locale_provider.dart';
import 'package:weather/core/theme/theme_provider.dart';
import 'package:weather/presentation/weather/pages/weather_page.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.watch<LocaleProvider>().locale,
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeProvider>().themeData,
      home: WeatherPage(),
    );
  }
}
