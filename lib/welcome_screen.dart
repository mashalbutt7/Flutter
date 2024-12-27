import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF4E9), // Light green background
      body: Padding(
        padding: const EdgeInsets.only(
            top: 100.0), // Added padding to move content down
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align content at the top
          children: [
            // Earth Image with Recycle Arrows right after AppBar
            Image.asset(
              'assets/2-removebg-preview.png', // Replace with actual image path
              height: 430, // Adjusted size of the Earth image
            ),
            const SizedBox(height: 20),
            // App Title with white text
            const Text(
              'Smart Waste Management System',
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color:
                    Color.fromARGB(255, 0, 0, 0), // Changed font color to black
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Login Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/login_screen'); // Navigate to LoginScreen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E7835),
                minimumSize: const Size(150, 40),
              ),
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white), // White text in button
              ),
            ),
            const SizedBox(height: 10),
            // Sign Up Button with "New around here?" text next to it
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'New around here?',
                  style: TextStyle(
                      color: Colors.black), // Black text for the question
                ),
                const SizedBox(width: 8), // Space between text and button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context,
                        '/role_selection_screen'); // Navigate to SignUpScreen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF2E7835), // Same color as Login button
                    minimumSize: const Size(150, 40),
                  ),
                  child: const Text(
                    'Sign Up',
                    style:
                        TextStyle(color: Colors.white), // White text in button
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
