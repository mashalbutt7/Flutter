import 'package:flutter/material.dart';
import 'package:flutter_application_1/about.dart';
import 'resident_home.dart';
import 'residentProfilePage.dart';

class ResidentMenu extends StatelessWidget {
  const ResidentMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Javaria Shabbir'),
            accountEmail: Text('Admin'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image(
                  image: AssetImage('assets/linda.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF2E7835),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResidentHomePage()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('My Profile'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResidentProfilePage()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutPage()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
