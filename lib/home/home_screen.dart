import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/home/parts_of_home/home.dart';
import 'package:my_flutter_app/home/parts_of_home/profile_ui.dart';
import 'package:my_flutter_app/home/parts_of_home/search_dart.dart';
import 'package:my_flutter_app/navbar/Navbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  static final List<Widget> widgetOptions = <Widget>[
    HomeUi(),
    SearchUi(),
    ProfileUi(),
    const Text("Text 04")
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
            // Image.asset(
            //   "assets/img/larrow.png",
            //   width: 18.0,
            //   height: 18.0,
            // ),
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
          showSelectedLabels: true, // Set to true to show selected item label
          showUnselectedLabels:
              true, // Set to true to show unselected item labels
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
                label: "Search"), // Update label here
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
                label: "Tickets"), // Update label here
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
                label: "Profile"), // Update label here
          ],
        ),
      ),
    );
  }
}
