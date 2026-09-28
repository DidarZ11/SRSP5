import 'package:flutter/material.dart';

// Языки приложения.
class AppLocales {
  static const ru = Locale('ru');
  static const en = Locale('en');
  static const kk = Locale('kk');

  static const all = [ru, en, kk];

  static const path = 'assets/translations';

  // Название языка, которое показываем пользователю
  static String name(Locale locale) {
    if (locale.languageCode == 'ru') return 'Русский';
    if (locale.languageCode == 'en') return 'English';
    return 'Қазақша';
  }
}
