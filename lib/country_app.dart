import 'package:country_list/core/router/routes.dart';
import 'package:flutter/material.dart';

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
