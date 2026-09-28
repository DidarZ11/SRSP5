import 'package:flutter/material.dart';

import '../widgets/bottom_bar.dart';
import 'catalog_page.dart';
import 'favorites_page.dart';
import 'home_page.dart';
import 'profile_page.dart';

// Главный экран: хранит номер текущей страницы и показывает нужную.
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Список страниц создаём здесь, а не в поле класса.
    // Если написать const-список в поле, Flutter будет считать виджеты
    // одинаковыми и не перерисует их при смене языка.
    final List<Widget> pages = [
      HomePage(),
      CatalogPage(),
      FavoritesPage(),
      ProfilePage(),
    ];

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
