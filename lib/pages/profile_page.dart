import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/localization/app_locales.dart';
import '../translations/locale_keys.g.dart';
import 'user_info_page.dart';

// Страница профиля
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool notifications = true;

  // окно выбора языка
  void changeLanguage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(LocaleKeys.language.tr(), style: AppTextStyles.subtitle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: AppLocales.all.map((locale) {
              return ListTile(
                title: Text(AppLocales.name(locale)),
                onTap: () {
                  // меняем язык приложения
                  context.setLocale(locale);
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.profile.tr())),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          // аватар и имя
          Column(
            children: [
              CircleAvatar(
                radius: 45.r,
                backgroundColor: AppColors.primary,
                child: Icon(Icons.person, size: 50.sp, color: AppColors.white),
              ),
              SizedBox(height: 12.h),
              Text(LocaleKeys.user_name.tr(), style: AppTextStyles.title),
              SizedBox(height: 4.h),
              Text('zainullindidar@gmail.com', style: AppTextStyles.caption),
            ],
          ),
          SizedBox(height: 24.h),

          // настройки
          Text(LocaleKeys.settings.tr(), style: AppTextStyles.subtitle),
          SizedBox(height: 8.h),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                // переключатель языка
                ListTile(
                  leading: const Icon(Icons.language, color: AppColors.primary),
                  title: Text(
                    LocaleKeys.language.tr(),
                    style: AppTextStyles.body,
                  ),
                  trailing: Text(
                    AppLocales.name(context.locale),
                    style: AppTextStyles.caption,
                  ),
                  onTap: changeLanguage,
                ),
                const Divider(height: 1),
                SwitchListTile(
                  secondary: const Icon(
                    Icons.notifications,
                    color: AppColors.primary,
                  ),
                  title: Text(
                    LocaleKeys.notifications.tr(),
                    style: AppTextStyles.body,
                  ),
                  value: notifications,
                  onChanged: (value) {
                    setState(() {
                      notifications = value;
                    });
                  },
                ),
                const Divider(height: 1),
                // SRSP5: данные, сохранённые формой регистрации при входе
                // в приложение (SharedPreferences)
                ListTile(
                  leading: const Icon(
                    Icons.badge_outlined,
                    color: AppColors.primary,
                  ),
                  title: Text(
                    'User Info',
                    style: AppTextStyles.body,
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const UserInfoPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
