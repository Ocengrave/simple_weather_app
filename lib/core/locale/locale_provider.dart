import 'package:flutter/widgets.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = Locale('ru');

  Locale get locale => _locale;

  set themeData(Locale locale) {
    _locale = locale;

    notifyListeners();
  }

  void toggleLocale(Locale locale) {
    if (_locale == locale) {
      return;
    }

    _locale = locale;
  }
}
