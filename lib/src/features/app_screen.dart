import 'package:ebank/src/ui/navigation/index.dart';
import 'package:ebank/src/ui/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerConfig = ref.watch(goRouterProvider);
    final themeModeState = ref.watch(themesProvider);

    final textTheme = Theme.of(context).textTheme;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
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
