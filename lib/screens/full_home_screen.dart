import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FullHomeScreen extends StatelessWidget {
  const FullHomeScreen({super.key});

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Полный доступ'),
        actions: [
          IconButton(
            onPressed: _signOut,
            icon: const Icon(Icons.logout),
            tooltip: 'Выйти',
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Вы вошли как: ${user?.email ?? 'без email'}'),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Закрытая функция выполнена!'),
                    ),
                  );
                },
                child: const Text('Закрытая функция (доступно)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
