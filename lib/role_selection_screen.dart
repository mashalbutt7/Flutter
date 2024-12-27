import 'package:flutter/material.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF4E9), // Light green background
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF4E9),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
                context); // This will go back to the previous screen (WelcomeScreen)
          },
        ),
        title: Text(
          'SignUp',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 0), // Increased top padding for more space
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Shrink Column size to its content
            mainAxisAlignment:
                MainAxisAlignment.start, // Align content to the top
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center content horizontally
            children: [
              // Earth Image with Recycle Arrows
              Image.asset(
                'assets/2-removebg-preview.png', // Replace with your earth image path
                height: 300,
                width: 300,
              ),
              const SizedBox(
                  height: 10), // Reduced space between the image and text
              const Text(
                'Are you a resident or a driver?',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              // New Resident Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup_screen');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7835),
                  minimumSize: const Size(200, 50),
                ),
                child: const Text('New Resident',
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 30),
              // Apply as Driver Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup_screen');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7835),
                  minimumSize: const Size(200, 50),
                ),
                child: const Text(
                  'Apply as a Driver',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
