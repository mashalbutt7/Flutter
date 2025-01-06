import 'package:flutter/material.dart';
import 'about.dart';
import 'notifications.dart';
import 'resident_home.dart';
import 'residentProfilePage.dart';

class residentBottomSection extends StatefulWidget {
  @override
  State<residentBottomSection> createState() => _residentBottomSectionState();
}

class _residentBottomSectionState extends State<residentBottomSection> {
  int selectedIndex = 0;

  void tappedFunction(int index) {
    setState(() {
      selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ResidentHomePage()));
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NotificationsPage()));
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AboutPage()));
      case 3:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ResidentProfilePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: tappedFunction,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.white),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications, color: Colors.white),
          label: "Notifications",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info, color: Colors.white),
          label: "About",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Colors.white),
          label: "Profile",
        ),
      ],
      backgroundColor: const Color(0xFF2E7835),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
    );
  }
}
