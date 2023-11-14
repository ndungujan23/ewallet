import 'package:ebank/src/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider).user;

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              context.pop();
            },
          ),
          centerTitle: false,
          title: Text(
            'Profile',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 22,
                  letterSpacing: 0,
                ),
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: NetworkImage(avatarPlaceholders.first)),
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).colorScheme.surfaceVariant),
                    child: const SizedBox(
                      height: 56,
                      width: 56,
                    ),
                  ),
                  title: Text(
                    "${user?.firstName ?? '--'} ${user?.lastName ?? '--'}",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  subtitle: Text(user?.phoneNumber ?? '--',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            letterSpacing: 0.20,
                          )),
                  trailing: IconButton(
                    onPressed: () {
                      context.go('/auth/signin');
                    },
                    icon: Icon(
                      Icons.logout,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
