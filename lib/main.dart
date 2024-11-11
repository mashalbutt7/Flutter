import 'package:flutter/material.dart';
import 'welcome_screen.dart';
//import 'login_screen.dart';
//import 'signup_screen.dart'; // Make sure you have these screens created

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
        '/loginScreen': (context) =>
            const LoginScreen(), // Define route for LoginScreen
        //     '/signup': (context) => const SignUpScreen(), // Define route for SignUpScreen
      },
    );
  }
}
