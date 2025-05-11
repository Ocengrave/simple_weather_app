import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  static const List<Locale> supportedLocales = [Locale('ru'), Locale('en')];

  Locale _locale = const Locale('ru');

  Locale get locale => _locale;

  void toggleLocale(Locale newLocale) {
    if (supportedLocales.contains(newLocale) == true) {
      _locale = newLocale;

      notifyListeners();
    }
  }

  Locale getNextLocale() {
    final int currentIndex = supportedLocales.indexOf(_locale);

    final int nextIndex = (currentIndex + 1) % supportedLocales.length;

    return supportedLocales[nextIndex];
  }
}
