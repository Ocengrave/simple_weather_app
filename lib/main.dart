import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:weather/core/application.dart';
import 'package:weather/core/injections.dart';
import 'package:weather/core/locale/locale_provider.dart';
import 'package:weather/core/theme/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await dotenv.load(fileName: ".env");

  final providers = createProviders();

  runApp(
    MultiProvider(
      providers: [
        ...providers,
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: EasyLocalization(
        supportedLocales: LocaleProvider.supportedLocales,
        path: 'l10n',
        child: Application(),
      ),
    ),
  );
}
