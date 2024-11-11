import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF4E9), // Light green background
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80), // Height of the app bar
        child: AppBar(
          backgroundColor: Colors.white, // Customize the app bar color
          elevation: 0, // Remove shadow
          flexibleSpace: Center(
            child: Image.asset(
              'assets/logo.png', // Path to your logo
              height: 80, // Set the height to fill the app bar
              fit:
                  BoxFit.fitHeight, // Ensure it fills the height of the app bar
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Align content at the top
        children: [
          // Earth Image with Recycle Arrows right after AppBar
          Image.asset(
            'assets/earth.png', // Replace with actual image path
            height: 430, // Adjusted size of the Earth image
          ),
          const SizedBox(height: 20),
          // App Title
          const Text(
            'Smart Waste Management System',
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          // Login Button
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login'); // Navigate to LoginScreen
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              minimumSize: const Size(150, 40),
            ),
            child: const Text('Login'),
          ),
          const SizedBox(height: 10),
          // Sign Up Option
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('New around here?'),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, '/signup'); // Navigate to SignUpScreen
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
