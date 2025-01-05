import 'package:flutter/material.dart';
import 'residentbottompage.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Color(0xFFEFF4E9), // Adjusted color for the AppBar
      ),
      body: Container(
        color: Color(0xFFEFF4E9), // Set the background color for the page
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to Smart Waste Manager',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E7835),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Your innovative solution for smarter and more sustainable waste management. Our mission is to transform the way waste is handled, ensuring a cleaner, greener, and more efficient environment for everyone.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 22.0),
                // Earth2.jpg image section
                Center(
                  child: Image.asset(
                    'assets/earth2r.png', // Path to your image
                    height: 320.0,
                    width: 250.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Our Vision',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'At Smart Waste Manager, we envision a future where waste management is not only efficient but also environmentally conscious. We aim to create a world where every individual contributes to a sustainable planet by making small yet impactful changes.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8.0),

                SizedBox(height: 8.0),
                Text(
                  'Email: support@smartwastemanager.com\nPhone: +1 234 567 890\nWebsite: www.smartwastemanager.com',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: const Color.fromARGB(255, 21, 98, 161)),
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AdminBottomSection(),
    );
  }
}
