import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GetStartedScreen extends ConsumerWidget {
  const GetStartedScreen({super.key});

  Widget _footerContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(
            12.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      context.go('/auth/signup');
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          width: 1,
                          color:
                              Theme.of(context).colorScheme.primaryContainer),
                    ),
                    child: Text(
                      'Sign Up',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: SizedBox(
                height: 50,
                child: FilledButton(
                  onPressed: () {
                    context.go('/auth/signin');
                  },
                  style: FilledButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer),
                  child: Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                ),
              ))
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: _footerContent(context),
            body: Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 100,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Let\'s Get Started',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'With Swift Pay, sending and receiving money has never been easier',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
