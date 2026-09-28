import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/data/manga_data.dart';
import '../widgets/manga_card.dart';
import '../translations/locale_keys.g.dart';

// Страница каталога
class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  // добавить или убрать товар из избранного
  void toggleFavorite(String id) {
    setState(() {
      if (favoriteIds.contains(id)) {
        favoriteIds.remove(id);
        _showMessage(LocaleKeys.removed.tr());
      } else {
        favoriteIds.add(id);
        _showMessage(LocaleKeys.added.tr());
      }
    });
  }

  void _showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text), duration: const Duration(seconds: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.catalog.tr())),
      body: GridView.builder(
        padding: EdgeInsets.all(16.w),
        itemCount: mangaList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          // обложки манги вертикальные, поэтому карточка узкая и высокая
          childAspectRatio: 0.56,
        ),
        itemBuilder: (context, index) {
          final manga = mangaList[index];
          return MangaCard(
            manga: manga,
            onFavorite: () => toggleFavorite(manga.id),
          );
        },
      ),
    );
  }
}
