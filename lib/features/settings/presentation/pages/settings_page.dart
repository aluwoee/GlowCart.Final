import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/theme_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  static const routeName = 'settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final isDark = themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Dark theme'),
            subtitle: const Text('Saved with Shared Preferences'),
            value: isDark,
            onChanged: (value) => ref.read(themeModeProvider.notifier).toggleTheme(value),
          ),
          const ListTile(
            leading: Icon(Icons.storage_outlined),
            title: Text('Local persistence'),
            subtitle: Text('Favorites and orders are saved with Drift SQLite'),
          ),
          const ListTile(
            leading: Icon(Icons.cloud_off_outlined),
            title: Text('Firebase'),
            subtitle: Text('Not included by request'),
          ),
        ],
      ),
    );
  }
}
