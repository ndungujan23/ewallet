import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ebank/src/ui/navigation/index.dart';
import 'package:ebank/src/ui/theme/themes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    runApp(const ProviderScope(child: MyApp()));

    // * This code will present some error UI if any uncaught exception happens
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
    };
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('An error occurred'),
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }, (error, stack) {
    // * Log any errors to console
    debugPrint(error.toString());
  });

  FlutterNativeSplash.remove();
}

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerConfig = ref.watch(goRouterProvider);
    final themeModeState = ref.watch(themesProvider);

    final textTheme = Theme.of(context).textTheme;
    return MaterialApp.router(
      routerConfig: routerConfig,
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      theme: Themes.lightTheme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(textTheme),
      ),
      darkTheme: Themes.darkTheme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(textTheme),
      ),
      themeMode: themeModeState,
    );
  }
}
