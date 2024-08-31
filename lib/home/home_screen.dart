import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:my_flutter_app/home/parts_of_home/home.dart';
import 'package:my_flutter_app/home/parts_of_home/profile_ui.dart';
import 'package:my_flutter_app/home/parts_of_home/search_dart.dart';
import 'package:my_flutter_app/navbar/Navbar.dart';
import 'package:my_flutter_app/home/parts_of_home/settings.dart'; // Import the SettingsUi

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  static List<Widget> widgetOptions = <Widget>[
    HomeUi(),
    SearchUi(),
    ProfileUi(),
    SettingsUi(themeModeNotifier: ValueNotifier(ThemeMode.light)), // Add SettingsUi here
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      endDrawer: Navbar(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: h * 0.14,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        leading: Container(
          margin: EdgeInsets.only(bottom: h * 0.08, right: h * 0.03),
          width: 32.0,
          height: 32.0,
          child: IconButton(
            icon: Icon(
              Icons.arrow_circle_left_outlined,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 5.0, left: 0, right: 40.0),
              width: w,
              height: h * 0.1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/logo.png"),
                      fit: BoxFit.contain)),
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: Center(child: widgetOptions[selectedIndex]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: const Color.fromARGB(255, 44, 44, 44)),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          elevation: 30,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blueGrey,
          unselectedItemColor: Color(0xFF526480),
          items: [
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
                label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
                label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_settings_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_settings_filled),
                label: "Settings"),
          ],
        ),
      ),
    );
  }
}
