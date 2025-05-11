import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/core/locale/locale_provider.dart';
import 'package:weather/presentation/weather/providers/weather_provider.dart';

class WeatherLanguageSwitcher extends StatelessWidget {
  const WeatherLanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    final currentLocale = localeProvider.locale;

    return PopupMenuButton<Locale>(
      icon: const Icon(Icons.language),
      onSelected: (locale) {
        localeProvider.toggleLocale(locale);
        Provider.of<WeatherProvider>(context, listen: false).fetchWeather();
      },
      itemBuilder: (_) {
        return LocaleProvider.supportedLocales.map((locale) {
          return PopupMenuItem(
            value: locale,
            child: Row(
              children: [
                Icon(
                  Icons.check,
                  color:
                      currentLocale == locale
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                ),
                const SizedBox(width: 8),
                Text(_getLanguageName(locale)),
              ],
            ),
          );
        }).toList();
      },
    );
  }

  String _getLanguageName(Locale locale) {
    switch (locale.languageCode) {
      case 'ru':
        return 'Русский';
      case 'en':
        return 'English';
      case 'es':
        return 'Español';
      default:
        return locale.languageCode.toUpperCase();
    }
  }
}
