import 'package:flutter/material.dart';
import 'about.dart'; // Import the About page here
import 'notifications.dart'; // Import the Notifications page here

class AdminBottomSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomAppBar(
        color: Color(0xFF2E7835),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Home icon
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    // Add navigation for Home here
                  },
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Text(
                  'Home',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 5,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // Notifications icon
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationsPage()),
                    );
                  },
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Text(
                  'Notifications',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 5,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // About icon
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutPage()),
                    );
                  },
                  icon: Icon(
                    Icons.description_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Text(
                  'About',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 5,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // Profile icon
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    // Add navigation for Profile here
                  },
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Text(
                  'Profile',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 5,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
