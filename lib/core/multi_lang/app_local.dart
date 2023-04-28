import 'dart:convert';

import 'package:country_list/core/multi_lang/app_localization_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocal {
  late Locale locale;
  late Map<String, String> _valueText;
  AppLocal(this.locale);

  static AppLocal of(BuildContext context) {
    return Localizations.of(context, AppLocal);
  }

  static const LocalizationsDelegate<AppLocal> delegate =
  AppLocalizationsDelegate();

  Future loadTranslateFile() async {
    String langFile =
    await rootBundle.loadString('assets/language/${locale.languageCode}.json');

    Map<String, dynamic> json = jsonDecode(langFile);
    _valueText = json.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslate(String key) {
    return _valueText[key]!;
  }
}