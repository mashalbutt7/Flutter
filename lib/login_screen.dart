import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
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
          'Login',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 80.0,
            left: 20.0,
            right: 20.0), // Added padding to move everything down
        child: Column(
          children: [
            SizedBox(height: 20),
            // Recycle Image
            Image.asset(
              'assets/recycling_symbol_182651-removebg-preview.png',
              height: 150,
            ),
            SizedBox(height: 20),
            // Email TextField
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Password TextField
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 10),
            // Forgot Password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Handle forgot password
                },
                child: Text(
                  'Forgot your password?',
                  style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Login Button (White with black text)
            ElevatedButton(
              onPressed: () {
                // After successful login, navigate to ResidentHomePage
                Navigator.pushReplacementNamed(context, '/resident_home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E7835), // White background
                minimumSize:
                    Size(double.infinity, 50), // Green border for the button
              ),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white), // Black text color
              ),
            ),
            SizedBox(height: 20),
            // New around here? Text and Register Button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New around here?',
                  style: TextStyle(color: Colors.black),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to SignUp page
                    Navigator.pushNamed(context, '/sign_up_screen');
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(color: const Color(0xFF2E7835)),
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
