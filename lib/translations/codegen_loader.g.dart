// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> _en = {
    "app_name": "Manga Shop",
    "home": "Home",
    "catalog": "Catalog",
    "favorites": "Favorites",
    "profile": "Profile",
    "welcome": "Welcome!",
    "welcome_text": "Find manga from your favorite series here",
    "popular": "Popular",
    "new_items": "New items",
    "card1_title": "Delivery",
    "card1_text": "We deliver in 2 days",
    "card2_title": "Original",
    "card2_text": "Licensed editions only",
    "volume": "Vol.",
    "tenge": "KZT",
    "added": "Added to favorites",
    "removed": "Removed from favorites",
    "empty_favorites": "Your favorites list is empty",
    "empty_text": "Tap the heart in the catalog",
    "user_name": "Didar Zainullin",
    "settings": "Settings",
    "language": "Language",
    "notifications": "Notifications",
  };
  static const Map<String, dynamic> _kk = {
    "app_name": "Manga Shop",
    "home": "Басты бет",
    "catalog": "Каталог",
    "favorites": "Таңдаулы",
    "profile": "Профиль",
    "welcome": "Қош келдіңіз!",
    "welcome_text": "Мұнда сүйікті серияларың бойынша манга табасың",
    "popular": "Танымал",
    "new_items": "Жаңалықтар",
    "card1_title": "Жеткізу",
    "card1_text": "Тапсырысты 2 күнде жеткіземіз",
    "card2_title": "Түпнұсқа",
    "card2_text": "Тек лицензиялық басылымдар",
    "volume": "Том",
    "tenge": "тг",
    "added": "Таңдаулыға қосылды",
    "removed": "Таңдаулыдан жойылды",
    "empty_favorites": "Таңдаулылар тізімі бос",
    "empty_text": "Каталогтан жүрекшені бас",
    "user_name": "Дидар Зайнуллин",
    "settings": "Баптаулар",
    "language": "Тіл",
    "notifications": "Хабарламалар",
  };
  static const Map<String, dynamic> _ru = {
    "app_name": "Manga Shop",
    "home": "Главная",
    "catalog": "Каталог",
    "favorites": "Избранное",
    "profile": "Профиль",
    "welcome": "Добро пожаловать!",
    "welcome_text": "Здесь ты найдёшь мангу любимых серий",
    "popular": "Популярное",
    "new_items": "Новинки",
    "card1_title": "Доставка",
    "card1_text": "Доставим заказ за 2 дня",
    "card2_title": "Оригинал",
    "card2_text": "Только лицензионные издания",
    "volume": "Том",
    "tenge": "тг",
    "added": "Добавлено в избранное",
    "removed": "Удалено из избранного",
    "empty_favorites": "Список избранного пуст",
    "empty_text": "Нажми на сердечко в каталоге",
    "user_name": "Дидар Зайнуллин",
    "settings": "Настройки",
    "language": "Язык",
    "notifications": "Уведомления",
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en": _en,
    "kk": _kk,
    "ru": _ru,
  };
}
