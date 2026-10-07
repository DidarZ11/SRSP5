import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_page.dart';
import 'registration_page.dart';

// SRSP5: решает, какой экран показать при старте приложения.
// Если имя уже сохранено в SharedPreferences (пользователь когда-то
// заполнил форму), сразу открываем Manga Shop. Если нет — просим
// зарегистрироваться. Так форму не нужно заполнять при каждом запуске.
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final fullName = snapshot.data!.getString('full_name') ?? '';
        return fullName.isNotEmpty
            ? const MainPage()
            : const RegistrationPage();
      },
    );
  }
}
