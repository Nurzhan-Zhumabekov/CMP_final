import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/services/preferences_service.dart';

final preferencesServiceProvider = FutureProvider<PreferencesService>((ref) async {
  return PreferencesService.create();
});

final themeNotifierProvider = AsyncNotifierProvider<ThemeNotifier, ThemeMode>(ThemeNotifier.new);

class ThemeNotifier extends AsyncNotifier<ThemeMode> {
  @override
  Future<ThemeMode> build() async {
    final prefs = await ref.watch(preferencesServiceProvider.future);
    return prefs.isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> toggle() async {
    final prefs = await ref.read(preferencesServiceProvider.future);
    final isDark = state.value == ThemeMode.dark;
    await prefs.setDarkMode(!isDark);
    state = AsyncData(!isDark ? ThemeMode.dark : ThemeMode.light);
  }
}
