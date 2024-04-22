import 'package:flutter/material.dart';
import 'package:my_flutter_app/home/home_screen.dart';
import 'package:my_flutter_app/home/parts_of_home/profile_ui.dart';
import 'package:my_flutter_app/home/parts_of_home/search_dart.dart';
import 'package:my_flutter_app/home/parts_of_home/settings.dart'; // Import the SettingsUi

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  Color _hoverColor = Colors.blue;
  Color _defaultColor = Colors.white;
  int _selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _animation = Tween<double>(begin: 0.0, end: 4.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _setHoverColor() {
    _animationController.forward();
  }

  void _resetHoverColor() {
    _animationController.reverse();
  }

  void _onItemClicked(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.grey[900],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 80,
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'IT PATHFINDERS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildNavItem(
                    index: 0,
                    icon: Icons.home,
                    title: 'Home',
                    onTap: () {
                      _onItemClicked(0);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                  _buildNavItem(
                    index: 1,
                    icon: Icons.search,
                    title: 'Search',
                    onTap: () {
                      _onItemClicked(1);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SearchUi()),
                      );
                    },
                  ),
                  _buildNavItem(
                    index: 2,
                    icon: Icons.person,
                    title: 'Profile',
                    onTap: () {
                      _onItemClicked(2);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileUi()),
                      );
                    },
                  ),
                  _buildNavItem(
                    index: 3,
                    icon: Icons.settings,
                    title: 'Settings',
                    onTap: () {
                      _onItemClicked(3);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsUi(themeModeNotifier: ValueNotifier(ThemeMode.light))),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      onHover: (isHovering) {
        isHovering ? _setHoverColor() : _resetHoverColor();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: _selectedIndex == index ? Colors.blue : Colors.transparent, width: _animation.value),
          ),
          color: _selectedIndex == index ? ColorTween(begin: Colors.transparent, end: _hoverColor).animate(_animationController).value : Colors.transparent,
        ),
        child: ListTile(
          leading: Icon(icon, color: _selectedIndex == index ? Colors.white : _defaultColor),
          title: Text(
            title,
            style: TextStyle(
              color: _selectedIndex == index ? Colors.white : _defaultColor,
            ),
          ),
        ),
      ),
    );
  }
}
