import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:ebank/src/core/index.dart';
import 'package:ebank/src/ui/widgets/index.dart';

final showPassProvider = StateProvider<bool>((ref) => true);
final rememberPassProvider = StateProvider<bool>((ref) => true);

class SignInScreen extends ConsumerStatefulWidget {
  static SignInScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const SignInScreen();

  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void togglePassword() {
    ref.read(showPassProvider.notifier).update((state) => !state);
  }

  void toggleRememberMe() {
    ref.read(rememberPassProvider.notifier).update((state) => !state);
  }

  String? validateUsername(String? value) {
    value = value ?? '';
    if (!value.isValidUsernameOrEmail) {
      return 'Username can only contain letters, numbers, underscores, and dashes or be a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    value = value ?? '';
    if (!value.isValidPassword) {
      return 'Password should contain 8 characters, 1 uppercase, 1 lowercase, 1 digit and 1 special character';
    }
    return null;
  }

  void onSignUp() {
    debugPrint('Do nothing');
  }

  void onSignIn() {
    if (_formKey.currentState!.validate()) {
      ref
          .watch(userRepositoryProvider)
          .signIn(_usernameController.text, _passwordController.text)
          .then((value) => {
                if (value != null) {context.go('/')} else {debugPrint('Nope!')}
              });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool showPassState = ref.watch(showPassProvider);
    final bool rememberPassState = ref.watch(rememberPassProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        forceMaterialTransparency: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 59),
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text(
                        'Welcome back 👋',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 22.0,
                    ),
                    child: CustomFormField(
                      hintText: 'Username or Email',
                      controller: _usernameController,
                      validator: validateUsername,
                      textInputAction: TextInputAction.next,
                      prefixIcon: const Icon(
                        Icons.person,
                        size: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: CustomFormField(
                      hintText: 'Password',
                      controller: _passwordController,
                      obscureText: showPassState,
                      validator: validatePassword,
                      textInputAction: TextInputAction.done,
                      prefixIcon: const Icon(
                        Icons.lock,
                        size: 20,
                      ),
                      suffixIcon: IconButton(
                        icon: showPassState
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        onPressed: togglePassword,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Checkbox(
                              value: rememberPassState,
                              onChanged: (v) {
                                toggleRememberMe();
                              },
                            ),
                            GestureDetector(
                              onTap: toggleRememberMe,
                              child: Text(
                                "Remember me",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inverseSurface),
                              ),
                            )
                          ],
                        ),
                        Text(
                          "Forgot password ?",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inverseSurface),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 34.0),
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: FilledButton(
                        onPressed: onSignIn,
                        style: FilledButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primaryContainer),
                        child: Text(
                          'Sign In',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: onSignUp,
                      child: Text.rich(
                        TextSpan(
                            text: 'Don\'t have an account? ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inverseSurface),
                            children: [
                              TextSpan(
                                  text: 'Sign up',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary)),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
