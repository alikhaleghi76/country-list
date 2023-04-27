import 'package:country_list/country_app.dart';
import 'package:country_list/core/di/locator.dart';
import 'package:flutter/material.dart';

Future<void> main() async {

  await initializeDependencies();

  runApp(const CountryApp());
}
