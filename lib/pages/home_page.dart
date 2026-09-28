import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/data/manga_data.dart';
import '../translations/locale_keys.g.dart';

// Главная страница
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.app_name.tr())),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // заголовок и приветственный текст
            Text(LocaleKeys.welcome.tr(), style: AppTextStyles.title),
            SizedBox(height: 8.h),
            Text(LocaleKeys.welcome_text.tr(), style: AppTextStyles.caption),
            SizedBox(height: 20.h),

            // баннер с иконкой
            Container(
              width: double.infinity,
              height: 140.h,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.popular.tr(),
                          style: AppTextStyles.white,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Naruto, Chainsaw Man, Blue Lock',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.menu_book, size: 60.sp, color: AppColors.white),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            // две карточки
            Row(
              children: [
                Expanded(
                  child: _infoCard(
                    Icons.local_shipping,
                    LocaleKeys.card1_title.tr(),
                    LocaleKeys.card1_text.tr(),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _infoCard(
                    Icons.verified,
                    LocaleKeys.card2_title.tr(),
                    LocaleKeys.card2_text.tr(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),

            // новинки
            Text(LocaleKeys.new_items.tr(), style: AppTextStyles.subtitle),
            SizedBox(height: 12.h),
            SizedBox(
              height: 220.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mangaList.length,
                itemBuilder: (context, index) {
                  final manga = mangaList[index];
                  return Container(
                    width: 120.w,
                    margin: EdgeInsets.only(right: 12.w),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12.r),
                            ),
                            child: Image.asset(
                              manga.image,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: AppColors.secondary,
                                  child: Icon(
                                    Icons.menu_book,
                                    color: AppColors.white,
                                    size: 30.sp,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(6.w),
                          child: Text(
                            manga.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 13.sp),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // маленькая карточка с иконкой и текстом
  Widget _infoCard(IconData icon, String title, String text) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary, size: 28.sp),
          SizedBox(height: 8.h),
          Text(title, style: AppTextStyles.body),
          SizedBox(height: 4.h),
          Text(text, style: AppTextStyles.caption),
        ],
      ),
    );
  }
}
