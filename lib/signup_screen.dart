import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF4E9),
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            // Spacer to push content down
            SizedBox(
                height:
                    60), // Adjust this height as needed to move content down

            // Logo (or other widgets can go here)

            // Name TextField
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your full name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),

            // Email TextField
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),

            // Contact Number TextField
            TextField(
              decoration: InputDecoration(
                labelText: 'Contact number',
                hintText: 'Enter your contact number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),

            // Profile Picture Upload
            Text(
              'Add a Profile Picture',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Handle profile picture upload
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.cloud_upload),
                      Text('Drag and Drop here or Browse'),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),

            // Password TextField
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 30),

            // Confirm Password TextField
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                hintText: 'Confirm your password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 40),

            // Create Account Button
            ElevatedButton(
              onPressed: () {
                // Handle sign up
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E7835), // Corrected parameter
                minimumSize: Size(double.infinity, 50),
              ),
              child:
                  Text('Create Account', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
