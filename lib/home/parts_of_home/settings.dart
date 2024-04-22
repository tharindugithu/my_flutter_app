import 'package:flutter/material.dart';

class SettingsUi extends StatelessWidget {
  final ValueNotifier<ThemeMode> themeModeNotifier;

  SettingsUi({required this.themeModeNotifier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Toggle Theme:'),
            ValueListenableBuilder<ThemeMode>(
              valueListenable: themeModeNotifier,
              builder: (context, themeMode, child) {
                return Switch(
                  value: themeMode == ThemeMode.dark,
                  onChanged: (bool value) {
                    themeModeNotifier.value =
                        value ? ThemeMode.dark : ThemeMode.light;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
