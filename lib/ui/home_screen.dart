import 'package:firebase_authentication/ui/vm/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text(
            'Sign out',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            ref.read(loginControllerProvider.notifier).signOut();
          },
        ),
      ),
    );
  }
}
