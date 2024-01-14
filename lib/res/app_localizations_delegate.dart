import 'package:flutter/material.dart';
import '../../res/strings/english_strings.dart';
import '../../res/strings/bangla_strings.dart';
import '../../res/strings/strings.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<CommonStrings> {

  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'bn'].contains(locale.languageCode);

  @override
  Future<CommonStrings> load(Locale locale) => _load(locale);

  static Future<CommonStrings> _load(Locale locale) async {
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
  bool shouldReload(LocalizationsDelegate<CommonStrings> old) => false;
  
}