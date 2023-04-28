import 'package:country_list/core/multi_lang/app_local.dart';
import 'package:country_list/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CountryApp extends StatelessWidget {
  const CountryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      localizationsDelegates: const [
        AppLocal.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('fa', ''),
      ],
// check Locale supported
      localeResolutionCallback: (Locale? deviceLocale, Iterable<Locale> supportedLocales) =>
          deviceLocale != null && ['en', 'fa'].contains(deviceLocale.languageCode)
              ? deviceLocale
              : supportedLocales.first,
      onGenerateInitialRoutes: (String page) {
        return [
          MaterialPageRoute(builder: (_) {
            return Routes().getScreen(page);
          })
        ];
      },
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (_) {
          return Routes().getScreen(settings.name ?? "/");
        });
      },
    );
  }
}
