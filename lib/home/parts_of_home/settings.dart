import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:fluentui_icons/fluentui_icons.dart';

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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSettingCard(
                  context,
                  icon: CupertinoIcons.bell,
                  text: 'Notifications',
                ),
                _buildSettingCard(
                  context,
                  icon: FluentSystemIcons.ic_fluent_location_filled,
                  text: 'Location',
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSettingCard(
                  context,
                  icon: CupertinoIcons.person,
                  text: 'Profile',
                ),
                _buildSettingCard(
                  context,
                  icon: FluentSystemIcons.ic_fluent_info_filled,
                  text: 'About',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingCard(BuildContext context, {required IconData icon, required String text}) {
    return SizedBox(
      width: 150, // Set the width of the card
      height: 150, // Set the height of the card
      child: Card(
        child: InkWell(
          onTap: () {
            // Action to perform when the card is tapped
            print('Tapped on $text');
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 40),
                SizedBox(height: 8),
                Text(
                  text,
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
