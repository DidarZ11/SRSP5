import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/data/manga_data.dart';
import '../translations/locale_keys.g.dart';

// Карточка манги: обложка, название, том, цена и кнопка избранного.
class MangaCard extends StatelessWidget {
  final Manga manga;
  final VoidCallback onFavorite;

  const MangaCard({super.key, required this.manga, required this.onFavorite});

  @override
  Widget build(BuildContext context) {
    // проверяем, есть ли товар в избранном
    final bool isFavorite = favoriteIds.contains(manga.id);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // обложка занимает всё свободное место — снизу не остаётся пустоты
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
              child: Image.asset(
                manga.image,
                width: double.infinity,
                fit: BoxFit.cover,
                // если файла нет — показываем иконку вместо ошибки
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.primary,
                    child: Icon(
                      Icons.menu_book,
                      size: 40.sp,
                      color: AppColors.white,
                    ),
                  );
                },
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  manga.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.subtitle,
                ),
                SizedBox(height: 2.h),
                Text(
                  '${LocaleKeys.volume.tr()} ${manga.volume} • ${manga.genre}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.caption,
                ),
                SizedBox(height: 6.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${manga.price} ${LocaleKeys.tenge.tr()}',
                      style: AppTextStyles.price,
                    ),
                    // кнопка добавления в избранное
                    GestureDetector(
                      onTap: onFavorite,
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite
                            ? AppColors.secondary
                            : AppColors.textSecondary,
                        size: 24.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
