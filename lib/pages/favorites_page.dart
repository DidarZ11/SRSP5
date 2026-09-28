import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/data/manga_data.dart';
import '../widgets/manga_card.dart';
import '../translations/locale_keys.g.dart';

// Страница избранного
class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    // берём из общего списка только то, что в избранном
    final favorites = mangaList
        .where((manga) => favoriteIds.contains(manga.id))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.favorites.tr())),
      body: favorites.isEmpty
          // если пусто — показываем заглушку
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 70.sp,
                    color: AppColors.grey,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    LocaleKeys.empty_favorites.tr(),
                    style: AppTextStyles.subtitle,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    LocaleKeys.empty_text.tr(),
                    style: AppTextStyles.caption,
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: favorites.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 0.56,
              ),
              itemBuilder: (context, index) {
                final manga = favorites[index];
                return MangaCard(
                  manga: manga,
                  onFavorite: () {
                    setState(() {
                      favoriteIds.remove(manga.id);
                    });
                  },
                );
              },
            ),
    );
  }
}
