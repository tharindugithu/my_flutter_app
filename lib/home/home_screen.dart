import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/home/parts_of_home/home.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  static final List<Widget> widgetOptions = <Widget>[
    HomeUi(),
    const Text("Text 04"),
    const Text("Text 06"),
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
      appBar: AppBar(
        toolbarHeight: h * 0.14,
        backgroundColor: Color(0xFFeeedf2),
        leading: Container(
          margin: EdgeInsets.only(bottom: h * 0.08, right: h * 0.03),
          width: 32.0,
          height: 32.0,
          child: IconButton(
            icon: Image.asset(
              "assets/img/larrow.png",
              width: 18.0,
              height: 18.0,
            ),
            onPressed: () {},
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        elevation: 30,
        showSelectedLabels: false,
        showUnselectedLabels: false,
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
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
              label: "Home")
        ],
      ),
    );
  }
}
