import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'guest_home_screen.dart';
import 'full_home_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Пока Firebase подключается — показываем индикатор
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final user = snapshot.data;

        // Если пользователь НЕ залогинен — гостевой экран
        if (user == null) {
          return const GuestHomeScreen();
        }

        // Если залогинен — полный доступ
        return const FullHomeScreen();
      },
    );
  }
}
