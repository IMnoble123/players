import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player/views/pages/nav_bar.dart';
import '../../auth/controller/authencation_controller.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authProvider.notifier);
    final authUser = ref.watch(authProvider).user;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("user id: ${authUser.id}"),
            Text("user email: ${authUser.email}"),
            Text("email verified: ${authUser.emailVerified}"),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const Bottomnavigationbarpae()));
                },
                child: const Text("Go to homepage")),
            TextButton(
              child: const Text("SignOut"),
              onPressed: () {
                authController.onSignOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
