import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/pages/calls.dart';
import 'package:frontend/pages/explore.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/pages/profile.dart';

class BottomNavbarWidget extends StatefulWidget {
  const BottomNavbarWidget({super.key});

  @override
  State<BottomNavbarWidget> createState() => _BottomNavbarWidgetState();
}

class _BottomNavbarWidgetState extends State<BottomNavbarWidget> {
  int currentIndex = 0;
  List<Widget> pages = [HomePage(), ExplorePage(), CallsPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.compass),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.phone),
            label: "Calls",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.circleUser),
            label: "Profile",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
      ),
    );
  }
}
