import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/app_colors.dart';
import 'core/localization/app_locales.dart';
import 'translations/codegen_loader.g.dart';
import 'pages/registration_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: AppLocales.all,
      path: AppLocales.path,
      fallbackLocale: AppLocales.ru,
      // переводы берём из сгенерированного codegen_loader.g.dart,
      // а не читаем JSON с диска при запуске
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

// Убирает эффект "резинки" при скролле до края списка.
// На Android по умолчанию весь список растягивается — выглядит криво.
class NoStretchScroll extends MaterialScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child; // отдаём список без эффекта растягивания
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ScreenUtilInit настраивает адаптивные размеры .w .h .sp
    return ScreenUtilInit(
      // базовый размер макета (обычный телефон)
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Manga Shop',

          // отключаем растягивание списков во всём приложении
          scrollBehavior: NoStretchScroll(),

          // настройки локализации
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,

          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.background,
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
            ),
          ),

          home: const RegistrationPage(),
        );
      },
    );
  }
}
