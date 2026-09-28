import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../translations/locale_keys.g.dart';

// Нижняя навигация. Отдельный виджет, чтобы не писать её в каждой странице.
class BottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      selectedFontSize: 12.sp,
      unselectedFontSize: 12.sp,
      iconSize: 24.sp,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: LocaleKeys.home.tr(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.shopping_bag),
          label: LocaleKeys.catalog.tr(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite),
          label: LocaleKeys.favorites.tr(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: LocaleKeys.profile.tr(),
        ),
      ],
    );
  }
}
