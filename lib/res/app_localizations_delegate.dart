import 'package:flutter/material.dart';
import '../../res/strings/english_strings.dart';
import '../../res/strings/bangla_strings.dart';
import '../../res/strings/strings.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Strings> {

  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'bn'].contains(locale.languageCode);

  @override
  Future<Strings> load(Locale locale) => _load(locale);

  static Future<Strings> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return EnglishStrings();
      case 'bn':
        return BanglaStrings();
      default:
        return EnglishStrings();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Strings> old) => false;
  
}