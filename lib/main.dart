import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'login_screen.dart'; // Make sure this is imported
import 'signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Waste Management System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      // Set WelcomeScreen as the initial screen
      home: WelcomeScreen(),
      routes: {
        '/login_screen': (context) => LoginScreen(), // Use '/login_screen' here
        '/signup_screen': (context) =>
            SignUpScreen(), // Define route for SignUpScreen
      },
    );
  }
}
