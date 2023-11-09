import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'color_schemes.g.dart';

class Themes {
  static final lightTheme = ThemeData(
      colorScheme: lightColorScheme,
      useMaterial3: true,
  );

  static final darkTheme = ThemeData(
      colorScheme: darkColorScheme,
      useMaterial3: true,
  );
}

class ThemesProvider extends StateNotifier<ThemeMode?> {
  ThemesProvider() : super(ThemeMode.system);

  void changeTheme(bool isOn) {
    state = isOn ? ThemeMode.dark : ThemeMode.light;
  }
}

final themesProvider = StateNotifierProvider<ThemesProvider, ThemeMode?>((_) {
  return ThemesProvider();
});
