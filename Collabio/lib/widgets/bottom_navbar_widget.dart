import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/pages/add_friends.dart';
import 'package:frontend/pages/calls.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/pages/nottifications.dart';

class BottomNavbarWidget extends StatefulWidget {
  const BottomNavbarWidget({super.key});

  @override
  State<BottomNavbarWidget> createState() => _BottomNavbarWidgetState();
}

class _BottomNavbarWidgetState extends State<BottomNavbarWidget> {
  int currentIndex = 0;
  List<Widget> pages = [HomePage(), AddFriendsPage(), NottificationsPage(), CallsPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.home, size: 28),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.search, size: 28),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.bell, size: 28),
                label: "Nottifications",
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.phoneVolume, size: 28),
                label: "Calls",
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            selectedItemColor: Color(0xFF2C5364),
            unselectedItemColor: Colors.grey[400],
            backgroundColor: Colors.transparent,
            elevation: 0,
            showUnselectedLabels: true,
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
            onTap: (index) => setState(() {
              currentIndex = index;
            }),
          ),
        ),
      ),
    );
  }
}
